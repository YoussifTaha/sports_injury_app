import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/routing/app_router.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SportsInjuryApp extends StatelessWidget {
  final AppRouter appRouter;
  const SportsInjuryApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    bool? isSignedUp = CacheHelper.getData(key: 'isSignedUp');
    bool? isLogedIn = CacheHelper.getData(key: 'isLogedIn');
    bool? isAccountCreated = CacheHelper.getData(key: 'isAccountCreated');
    String? isDoctor = CacheHelper.getData(key: 'userType');
    String? isDoctorAdded = CacheHelper.getData(key: 'myDoctorUid');

    String firstScreen = Routes.onBoardingScreen;

    if ((isSignedUp != null && isAccountCreated != null) || isLogedIn != null) {
      if (isDoctor == 'userDoctor') {
        firstScreen = Routes.homeScreen;
      } else {
        if (isDoctorAdded == null) {
          firstScreen = Routes.patientIdScreen;
        } else
          firstScreen = Routes.loadingScreen;
      }
    } else if (isSignedUp != null && isAccountCreated == null) {
      firstScreen = Routes.accountTypeScreen;
    } else
      firstScreen = Routes.onBoardingScreen;

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Antenatal App',
        initialRoute: firstScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
