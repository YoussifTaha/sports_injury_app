import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/errors/firebase_firestore_exception.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/tests/tests_repo.dart';

class TestsRepoImpl implements TestsRepo {
  List<DetailsModel> tests = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Failure, List<DetailsModel>>> fetchInjuriesTests(
      {required String regionName, required String injuryName}) async {
    tests = [];
    QuerySnapshot<Map<String, dynamic>> testsSnapshot =
        await myFirebaseFireStoreService.getInjuriesTestsCollection(
            regionName: regionName, injuryName: injuryName);
    try {
      for (var element in testsSnapshot.docs) {
        tests.add(DetailsModel.fromJson(element.data()));
      }
      return right(tests);
    } on Exception catch (e) {
      return left(
        FirebaseFireStoreException(
          e.toString(),
        ),
      );
    }
  }
}
