import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/errors/firebase_firestore_exception.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:sports_injury_app/features/possible_injuries/data/models/injuries_model.dart';
import 'package:sports_injury_app/features/possible_injuries/data/repo/injury_repo.dart';

class InjuriesRepoImpl implements InjuriesRepo {
  List<InjuriesModel> injuries = [];
  List<DetailsModel> anatomy = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Failure, List<InjuriesModel>>> fetchInjuriesToTheRegion(
      {required String regionName}) async {
    injuries = [];
    QuerySnapshot<Map<String, dynamic>> injuriesSnapshot =
        await myFirebaseFireStoreService.getInjuriesCollection(
            regionName: regionName);
    try {
      for (var element in injuriesSnapshot.docs) {
        injuries.add(InjuriesModel.fromJson(element.data()));
      }
      print(injuries.first.name);
      return right(injuries);
    } on Exception catch (e) {
      return left(
        FirebaseFireStoreException(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<DetailsModel>>> fetchRegionAnatomy(
      {required String regionName}) async {
    anatomy = [];
    QuerySnapshot<Map<String, dynamic>> anatomySnapshot =
        await myFirebaseFireStoreService.getAnatomyCollection(
            regionName: regionName);
    try {
      for (var element in anatomySnapshot.docs) {
        anatomy.add(DetailsModel.fromJson(element.data()));
      }

      return right(anatomy);
    } on Exception catch (e) {
      return left(
        FirebaseFireStoreException(
          e.toString(),
        ),
      );
    }
  }
}
