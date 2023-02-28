import 'package:dynoacademy/provider/dio/course/courses_provider.dart';
import 'package:dynoacademy/provider/textfield/textfield_provider.dart';
import 'package:dynoacademy/screens/home/home_provider.dart';
import 'package:dynoacademy/screens/user/user_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => HomeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CoursesProvider(),
      ),
    ],
    child: Builder(builder: (context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/userSignIn': (context) => ChangeNotifierProvider(
                  create: (_) => TextFieldProvider(),
                  child: const UserSignIn(),
                ),
            '/homeScreen': (context) => const HomeScreen(),
            '/splashScreen': (context) => const SplashScreen(),
          },
          initialRoute: '/splashScreen');
    }),
  ));
}
