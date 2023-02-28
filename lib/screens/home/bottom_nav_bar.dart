import 'package:dynoacademy/screens/cart/cart_screen.dart';
import 'package:dynoacademy/screens/home/home_provider.dart';
import 'package:dynoacademy/screens/home/home_screen.dart';
import 'package:dynoacademy/screens/mylearning/my_learning_screen.dart';
import 'package:dynoacademy/screens/profile/profile_screen.dart';
import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List navBarIndexPages = [
    const HomeScreen(),
    const MyLearningScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final navBarIndex = Provider.of<HomeProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
            ],
          ),
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: navBarIndex.currentNavIndex,
                  onTap: navBarIndex.changeNavIndex,
                  iconSize: 22,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                  selectedItemColor: primaryColor,
                  selectedLabelStyle: mainFont(),
                  unselectedLabelStyle: mainFont(),
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
                )),
          )),
      body: navBarIndexPages.elementAt(
        navBarIndex.currentNavIndex,
      ),
    );
  }
}
