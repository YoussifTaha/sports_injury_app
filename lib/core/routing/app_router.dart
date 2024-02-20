import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/features/account_type/ui/screens/account_type_screen.dart';
import 'package:sports_injury_app/features/home/ui/screens/home.dart';
import 'package:sports_injury_app/features/login/ui/screens/login_screen.dart';
import 'package:sports_injury_app/features/onBoarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:sports_injury_app/features/signup/ui/screens/signup_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.accountTypeScreen:
        return MaterialPageRoute(
          builder: (_) => const AccountType(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for this ${settings.name}'),
            ),
          ),
        );
    }
  }
}
