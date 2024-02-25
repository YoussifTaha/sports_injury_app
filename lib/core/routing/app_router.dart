import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/core/di/dependency_injection.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/features/account_type/ui/screens/account_type_screen.dart';
import 'package:sports_injury_app/features/home/ui/screens/home.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/mechanism/mechanism_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/tests/tests_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/treatment/treatment_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/logic/tests_cubit/tests_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/logic/treatment_cubit/treatment_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/ui/screens/injury_details.dart';
import 'package:sports_injury_app/features/login/ui/screens/login_screen.dart';
import 'package:sports_injury_app/features/onBoarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:sports_injury_app/features/possible_injuries/data/repo/injury_repo_impl.dart';
import 'package:sports_injury_app/features/possible_injuries/logic/cubit/possible_injuries_cubit.dart';
import 'package:sports_injury_app/features/signup/ui/screens/signup_screen.dart';

import '../../features/injury_details/logic/mechanism_cubit/injury_mechanism_cubit.dart';
import '../../features/injury_region/ui/screens/injury_region.dart';
import '../../features/possible_injuries/ui/screens/possible_injury_screen.dart.dart';

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
      case Routes.injuryRegionScreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => InjuryRegionScreen(
            injuryRegion: args?['injuryRegion'] ?? '',
          ),
        );
      case Routes.possibleInjuriescreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                PossibleInjuriesCubit(locator.get<InjuriesRepoImpl>()),
            child: PossibleInjuriescreen(
                injuryRegion: args?['injuryRegion'] ?? ''),
          ),
        );
      case Routes.injuryDetails:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<InjuryMechanismCubit>(
                create: (context) =>
                    InjuryMechanismCubit(locator.get<MechanismRepoImpl>()),
              ),
              BlocProvider<InjuryTestsCubit>(
                create: (context) =>
                    InjuryTestsCubit(locator.get<TestsRepoImpl>()),
              ),
              BlocProvider<InjuryTreatmentCubit>(
                create: (context) =>
                    InjuryTreatmentCubit(locator.get<TreatmentRepoImpl>()),
              ),
            ],
            child: InjuryDetails(
              regionName: args?['regionName'] ?? '',
              injuriesModel: args?['injuriesModel'] ?? '',
            ),
          ),
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
