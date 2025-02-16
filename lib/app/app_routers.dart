import 'package:datn_van_vanh/screens/app_home.dart';
import 'package:datn_van_vanh/screens/home/book_space_screen.dart';
import 'package:datn_van_vanh/screens/login/login_screen.dart';
import 'package:datn_van_vanh/screens/splash/first_screen.dart';
import 'package:datn_van_vanh/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static const String firstScreen = '/firts';
  static const String splashScreen = '/splash';
  static const String dashBoard = '/dashBoard';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String bookSpaceScreen = '/bookSpaceScreen';

  static final routes = <String, WidgetBuilder>{
    splashScreen: (BuildContext context) => const SplashScreen(),
    firstScreen: (BuildContext context) => const FirstScreen(),
    loginScreen: (BuildContext context) => const LoginPage(),
    dashBoard: (BuildContext context) => const Dashboard(),
    homeScreen: (BuildContext context) => const Dashboard(),
    bookSpaceScreen: (BuildContext context) => const BookSpaceScreen(),
  };
}
