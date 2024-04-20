import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';

abstract class MechanismRepo {
  Future<Either<Faliure, List<DetailsModel>>> fetchInjuriesMechanisms(
      {required String regionName, required String injuryName});
}