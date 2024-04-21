import 'package:sports_injury_app/core/routing/app_router.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SportsInjuryApp extends StatelessWidget {
  final AppRouter appRouter;
  const SportsInjuryApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Antenatal App',
        initialRoute: Routes.signupScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
