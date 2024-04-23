import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:sports_injury_app/features/possible_injuries/data/models/injuries_model.dart';

abstract class InjuriesRepo {
  Future<Either<Failure, List<InjuriesModel>>> fetchInjuriesToTheRegion(
      {required String regionName});
  Future<Either<Failure, List<DetailsModel>>> fetchRegionAnatomy(
      {required String regionName});
}
