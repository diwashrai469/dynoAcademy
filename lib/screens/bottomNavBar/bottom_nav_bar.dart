import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/screens/bottomNavBar/bottomNavBarItems/cart/cart_screen.dart';
import 'package:dynoacademy/screens/bottomNavBar/bottomNavBarItems/home/homeScreen/home_screen.dart';
import 'package:dynoacademy/screens/bottomNavBar/bottomNavBarItems/mylearning/my_learning_screen.dart';
import 'package:dynoacademy/screens/bottomNavBar/bottomNavBarItems/profile/profile_screen.dart';
import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CoursesProvider(),
      child: SafeArea(
          child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            iconSize: 25,

            // type: BottomNavigationBarType.fixed,
            // currentIndex: navBarIndex.currentNavIndex,
            // onTap: navBarIndex.changeNavIndex,
            // iconSize: 22,
            // selectedFontSize: 12,
            // unselectedFontSize: 12,
            // selectedItemColor: primaryColor,
            // selectedLabelStyle: mainFont(),
            // unselectedLabelStyle: mainFont(),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house_alt_fill),
                  label: "Home",
                  activeIcon: Icon(
                    CupertinoIcons.house_alt_fill,
                    color: primaryColor,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.book_circle),
                  label: "My Learning",
                  activeIcon: Icon(
                    CupertinoIcons.book_circle,
                    color: primaryColor,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart_fill),
                  label: "Cart",
                  activeIcon: Icon(
                    CupertinoIcons.cart_fill,
                    color: primaryColor,
                  )),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_crop_circle),
                label: "Profile",
                activeIcon: Icon(
                  CupertinoIcons.person_crop_circle,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(child: HomeScreen());
                  },
                );
              case 1:
                return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(child: MyLearningScreen());
                  },
                );
              case 2:
                return CupertinoTabView(
                  builder: (context) {
                    return const  CupertinoPageScaffold(child: CartScreen());
                  },
                );
              case 3:
                return CupertinoTabView(
                  builder: (context) {
                    return const CupertinoPageScaffold(child: ProfileScreen());
                  },
                );
            }
            return Container();
          },
        ),
      )),
    );
  }
}
