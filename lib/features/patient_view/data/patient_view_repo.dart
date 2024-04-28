import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class PatientsViewInfoRepo {
  Future<Either<Failure, UserModel>> getBasicPatientInfo();

  Future<Either<Failure, List<String>>> fetchRadiology(
      {required int patientId});

  Future<Either<Failure, List<DetailsModel>>> fetchTreatment(
      {required int patientId});
}
