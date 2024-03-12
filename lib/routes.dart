import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/homeMainScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/loginScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/siginScreen.dart';

Route getRoutes({required RouteSettings routeSettings}) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return HomeScreen();
          });
    case SignupScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return SignupScreen();
          });
    case LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return LoginScreen();
          });
    default:
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          body: Center(
            child: Text('Route does\'nt exist'),
          ),
        );
      });
  }
}
