import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/core/di/dependency_injection.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/features/account_type/data/repos/account_type_repo_impl.dart';
import 'package:sports_injury_app/features/account_type/logic/cubit/account_type_cubit.dart';
import 'package:sports_injury_app/features/account_type/ui/screens/account_type_screen.dart';
import 'package:sports_injury_app/features/bag/ui/screens/bag.dart';
import 'package:sports_injury_app/features/home/data/repos/home_repo_impl.dart';
import 'package:sports_injury_app/features/home/logic/cubit/home_cubit.dart';
import 'package:sports_injury_app/features/home/ui/screens/home.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/mechanism/mechanism_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/physical_examination/physical_examination_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/tests/tests_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/treatment/treatment_repo_impl.dart';
import 'package:sports_injury_app/features/injury_details/logic/physical_examination_cubit/physical_examination_cubit.dart';
import 'package:sports_injury_app/features/injury_details/logic/tests_cubit/tests_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/logic/treatment_cubit/treatment_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/ui/screens/injury_details.dart';
import 'package:sports_injury_app/features/login/data/repos/login_repo_impl.dart';
import 'package:sports_injury_app/features/login/logic/cubit/login_cubit.dart';
import 'package:sports_injury_app/features/login/ui/screens/login_screen.dart';
import 'package:sports_injury_app/features/onBoarding/ui/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:sports_injury_app/features/possible_injuries/data/repo/injury_repo_impl.dart';
import 'package:sports_injury_app/features/possible_injuries/logic/cubit/possible_injuries_cubit.dart';
import 'package:sports_injury_app/features/post_login/data/repo/post_login_repo_impl.dart';
import 'package:sports_injury_app/features/post_login/logic/cubit/post_login_cubit.dart';
import 'package:sports_injury_app/features/post_login/ui/screens/post_login.dart';
import 'package:sports_injury_app/features/signup/data/repos/signup_repo_impl.dart';
import 'package:sports_injury_app/features/signup/logic/cubit/signup_cubit.dart';
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
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(locator.get<LoginRepoImpl>()),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit((locator.get<SignUpRepoImpl>())),
            child: const SignupScreen(),
          ),
        );
      case Routes.accountTypeScreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AccountTypeCubit(locator.get<AccountTypeRepoImpl>()),
            child: AccountType(
                email: args?['email'] ?? '',
                fullName: args?['fullName'] ?? '',
                phone: args?['phone'] ?? ''),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(locator.get<HomeRepoImpl>()),
            child: const HomeScreen(),
          ),
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
              BlocProvider<InjuryPhysicalExaminationCubit>(
                create: (context) => InjuryPhysicalExaminationCubit(
                    locator.get<PhysicalExaminationRepoImpl>()),
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
      case Routes.bag:
        return MaterialPageRoute(
          builder: (_) => const BagScreen(),
        );
      case Routes.postLoginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                PostLoginCubit(locator.get<PostLoginRepoImpl>()),
            child: PostLogiScreen(),
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
