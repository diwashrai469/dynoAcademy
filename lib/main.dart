import 'package:dynoacademy/provider/textfield/textfield_provider.dart';
import 'package:dynoacademy/screens/user/user_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/bottomNavBar/bottomNavBarItems/home/homeScreen/home_screen.dart';
import 'screens/splash/splash_screen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/userSignIn': (context) => ChangeNotifierProvider.value(
              value: TextFieldProvider(),
              child: const UserSignIn(),
            ),
        '/homeScreen': (context) => const HomeScreen(),
        '/splashScreen': (context) => const SplashScreen(),
      },
      initialRoute: '/splashScreen'));
}
