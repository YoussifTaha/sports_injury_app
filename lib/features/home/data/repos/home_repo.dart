import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UserModel>>> fetchMyPatients(
      {required String uId});

  Future<Either<Failure, String>> fetchDoctorName({required String uId});
}
