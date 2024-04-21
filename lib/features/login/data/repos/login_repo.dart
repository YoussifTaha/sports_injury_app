import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/login/data/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserCredential>> login({
    required LoginModel loginModel,
  });
}
