import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:units_/views/pages/sign_in.dart';

import '../views/pages/home_page.dart';
import '../views/pages/units_list.dart';

class RouteManager {
  static const String signIn = '/';
  static const String homePage = '/homePage';
  static const String unitsPage = '/unitsPage';

  static Route<dynamic> routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case unitsPage:
        return MaterialPageRoute(
          builder: (context) => const UnitsPage(),
        );

      default:
        throw const FormatException('Error: Route could not be found');
    }
  }
}
