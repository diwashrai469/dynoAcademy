import 'package:dynoacademy/screens/home/home_state/home_state_provider.dart';
import 'package:dynoacademy/screens/home/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:dynoacademy/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    fadeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController.view);
    _animationController.forward().then((value) => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => ChangeNotifierProvider(
              create: (_) => HomeStateProvider(),
              child: const BottomNavBar(),
            ),
            transitionDuration: const Duration(
              seconds: 5,
            ),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: FadeTransition(
            opacity: fadeAnimation,
            child: Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ),
          )),
    );
  }
}
