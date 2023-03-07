import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/screens/user/user_sign_in.dart';
import 'package:flutter/material.dart';
import 'screens/home/home_screen/home_screen.dart';
import 'screens/splash/splash_screen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/userSignIn': (context) => const HomeScreen(),
        '/splashScreen': (context) => const SplashScreen(),
      },
      initialRoute: '/splashScreen'));
}
