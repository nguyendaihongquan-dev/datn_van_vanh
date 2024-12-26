import 'package:datn_van_vanh/screens/app_home.dart';
import 'package:datn_van_vanh/screens/home/home_screen.dart';
import 'package:datn_van_vanh/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static const String splashScreen = '/splash';
  static const String dashBoard = '/dashBoard';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';

  static final routes = <String, WidgetBuilder>{
    loginScreen: (BuildContext context) => const LoginPage(),
    homeScreen: (BuildContext context) => const HomeScreen(),
    dashBoard: (BuildContext context) => const Dashboard(),
  };
}
