import 'package:flutter/material.dart';
import 'package:fruitsapp/features/homeScreen/view/categoryList.dart';
import 'package:fruitsapp/features/homeScreen/view/categoryPage.dart';
import 'package:fruitsapp/features/homeScreen/view/homeMainScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/loginScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/phoneVerificationScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/siginScreen.dart';
import 'package:fruitsapp/features/welcomeScreen/view/verifyEmailPage.dart';

import 'features/homeScreen/view/profilePage.dart';

Route getRoutes({required RouteSettings routeSettings}) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return HomeScreen();
          });
    case VerifyEmailPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return VerifyEmailPage();
          });
    case PhoneVerificationScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return PhoneVerificationScreen();
          });
    case EditProfilePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return EditProfilePage();
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
    case CategoryListPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return CategoryListPage();
          });
    case CategoryDetailPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            var currentCategory = routeSettings.arguments as int;
            return CategoryDetailPage(
              currentCategory: currentCategory,
            );
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
