import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/errors/firebase_firestore_exception.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/mechanism/mechanism_repo.dart';

class MechanismRepoImpl implements MechanismRepo {
  List<DetailsModel> mechanism = [];
  List<DetailsModel> tests = [];
  List<DetailsModel> treatment = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Failure, List<DetailsModel>>> fetchInjuriesMechanisms(
      {required String regionName, required String injuryName}) async {
    mechanism = [];
    QuerySnapshot<Map<String, dynamic>> mechanismSnapshot =
        await myFirebaseFireStoreService.getInjuriesMechanismsCollection(
            regionName: regionName, injuryName: injuryName);
    try {
      for (var element in mechanismSnapshot.docs) {
        mechanism.add(DetailsModel.fromJson(element.data()));
      }
      return right(mechanism);
    } on Exception catch (e) {
      return left(
        FirebaseFireStoreException(
          e.toString(),
        ),
      );
    }
  }
}
