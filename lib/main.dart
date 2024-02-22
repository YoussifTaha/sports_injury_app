import 'package:firebase_core/firebase_core.dart';
import 'package:sports_injury_app/firebase_options.dart';
import 'package:sports_injury_app/sports_injury_app.dart';
import 'package:sports_injury_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SportsInjuryApp(
    appRouter: AppRouter(),
  ));
}
