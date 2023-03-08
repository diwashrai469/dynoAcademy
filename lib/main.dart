import 'package:dynoacademy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'screens/home/home_screen/home_screen.dart';
import 'screens/splash/splash_screen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: AppTheme().lightTheme,
      debugShowCheckedModeBanner: false,
      
      routes: {
        '/userSignIn': (context) => const HomeScreen(),
        '/splashScreen': (context) => const SplashScreen(),
      },
      initialRoute: '/splashScreen'));
}
