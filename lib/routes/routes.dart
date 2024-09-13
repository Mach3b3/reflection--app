import 'package:flutter/material.dart';
import 'package:term_1_reflection/views/pages/Main_Page.dart';
import 'package:term_1_reflection/views/pages/login.dart';
import 'package:term_1_reflection/views/pages/understood.dart';
import 'package:term_1_reflection/views/pages/not_understood.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String mainPage = '/mainPage';
  static const String understoodPage = '/understoodPage';
  static const String notUnderstoodPage = '/notUnderstoodPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );

      case mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );

      case understoodPage:
        return MaterialPageRoute(
          builder: (context) => const UnderstoodPage(),
        );

      case notUnderstoodPage:
        return MaterialPageRoute(
          builder: (context) => const NotUnderstoodPage(),
        );

      default:
        throw const FormatException('Route not found! Check routes again!');
    }
  }
}
