import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/errors/firebase_firestore_exception.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'treatment_repo.dart';

class TreatmentRepoImpl implements TreatmentRepo {
  List<DetailsModel> treatment = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Faliure, List<DetailsModel>>> fetchInjuriesTreatment(
      {required String regionName, required String injuryName}) async {
    treatment = [];
    QuerySnapshot<Map<String, dynamic>> treatmentSnapshot =
        await myFirebaseFireStoreService.getInjuriesTreatmentCollection(
            regionName: regionName, injuryName: injuryName);
    try {
      for (var element in treatmentSnapshot.docs) {
        treatment.add(DetailsModel.fromJson(element.data()));
      }
      return right(treatment);
    } on Exception catch (e) {
      return left(
        FirebaseFireStoreException(
          e.toString(),
        ),
      );
    }
  }
}
