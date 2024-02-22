import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/possible_injuries/data/models/injuries_model.dart';

abstract class InjuriesRepo {
  Future<Either<Faliure, List<InjuriesModel>>> fetchInjuriesToTheRegion(
      {required String regionName});
}
