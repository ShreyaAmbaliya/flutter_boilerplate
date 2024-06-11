import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/splash_screen.dart';

var data = "";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return PageTransition(child: SplashScreen(), type: PageTransitionType.fade);
      case '/Home':
        return PageTransition(child: HomeScreen(), type: PageTransitionType.rightToLeft);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: SafeArea(
              child: Text('Route Error ${settings.name}'),
            ),
          ),
        );
    }
  }
}
