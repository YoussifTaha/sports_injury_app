import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/home/data/repos/home_repo.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  List<UserModel> patients = [];
  String doctorName = '';
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();
  @override
  Future<Either<Failure, List<UserModel>>> fetchMyPatients(
      {required String uId}) async {
    patients = [];
    QuerySnapshot<Map<String, dynamic>> PatientsSnapshot =
        await myFirebaseFireStoreService.getMyPatientsCollection(uid: uId);
    try {
      for (var element in PatientsSnapshot.docs) {
        patients.add(UserModel.fromJson(element.data()));
      }
      return right(patients);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, String>> fetchDoctorName({required String uId}) async {
    DocumentSnapshot doctorDoc =
        await myFirebaseFireStoreService.getDoctorDoc(uid: uId);
    try {
      doctorName = doctorDoc.get('fullName');
      CacheHelper.saveData(
        key: 'doctorName',
        value: doctorName,
      );
      return right(doctorName);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }
}
