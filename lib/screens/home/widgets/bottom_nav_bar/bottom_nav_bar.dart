import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/screens/home/home_screen/home_screen.dart';
import 'package:dynoacademy/screens/home/home_state/home_state_provider.dart';
import 'package:dynoacademy/screens/home/widgets/cart/cart_screen.dart';
import 'package:dynoacademy/screens/home/widgets/mylearning/my_learning_screen.dart';
import 'package:dynoacademy/screens/home/widgets/profile/profile_screen.dart';
import 'package:dynoacademy/theme/app_theme.dart';
import 'package:dynoacademy/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List myWidget = [
    const HomeScreen(),
    const MyLearningScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navBarIndex = Provider.of<HomeStateProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => CoursesProvider(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navBarIndex.currentIndex,
            onTap: navBarIndex.getNavIndex,
            iconSize: 22,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: AppTheme().primaryColor,
            selectedLabelStyle:Constant().mainFont(),
            unselectedLabelStyle: Constant().mainFont(),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.house_alt_fill),
                  label: "Home",
                  activeIcon: Icon(
                    CupertinoIcons.house_alt_fill,
                    color: AppTheme().primaryColor,
                  )),
              BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.book_circle),
                  label: "My Learning",
                  activeIcon: Icon(
                    CupertinoIcons.book_circle,
                    color: AppTheme().primaryColor,
                  )),
              BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.cart_fill),
                  label: "Cart",
                  activeIcon: Icon(
                    CupertinoIcons.cart_fill,
                    color: AppTheme().primaryColor,
                  )),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person_crop_circle),
                label: "Profile",
                activeIcon: Icon(
                  CupertinoIcons.person_crop_circle,
                  color: AppTheme().primaryColor,
                ),
              ),
            ],
          ),
          body: myWidget.elementAt(navBarIndex.currentIndex),
        ),
      ),
    );
  }
}
