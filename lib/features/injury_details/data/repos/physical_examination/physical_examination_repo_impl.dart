import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/errors/firebase_firestore_exception.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/physical_examination/physical_examination_repo.dart';

class PhysicalExaminationRepoImpl implements PhysicalExaminationRepo {
  List<DetailsModel> physicalExamination = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Failure, List<DetailsModel>>> fetchInjuriesPhysicalExamination(
      {required String regionName,
      required String physicalExaminationName}) async {
    physicalExamination = [];
    QuerySnapshot<Map<String, dynamic>> physicalExaminationSnapshot =
        await myFirebaseFireStoreService
            .getInjuriesPhysicalExaminationCollection(
                regionName: regionName,
                physicalExaminationName: physicalExaminationName);
    try {
      for (var element in physicalExaminationSnapshot.docs) {
        physicalExamination.add(DetailsModel.fromJson(element.data()));
      }
      return right(physicalExamination);
    } on Exception catch (e) {
      return left(
        FirebaseFireStoreException(
          e.toString(),
        ),
      );
    }
  }
}
