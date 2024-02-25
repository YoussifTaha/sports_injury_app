import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';

abstract class TestsRepo {
  Future<Either<Faliure, List<DetailsModel>>> fetchInjuriesTests(
      {required String regionName, required String injuryName});
}
