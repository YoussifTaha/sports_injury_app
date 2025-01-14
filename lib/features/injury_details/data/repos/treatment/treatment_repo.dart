import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';

abstract class TreatmentRepo {
  Future<Either<Failure, List<DetailsModel>>> fetchInjuriesTreatment(
      {required String regionName, required String injuryName});
}
