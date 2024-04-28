import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';

import 'package:sports_injury_app/features/patient_view/data/patient_view_repo.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class PatientsViewInfoRepoImpl extends PatientsViewInfoRepo {
  UserModel? patient;
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  String? myDoctorUid = CacheHelper.getData(key: 'myDoctorUid');
  List<String> radiology = [];
  List<DetailsModel> treatment = [];

  @override
  Future<Either<Failure, UserModel>> getBasicPatientInfo() async {
    print('realpatientId: ${CacheHelper.getData(key: 'patientId')}');
    DocumentSnapshot patientDoc = await myFirebaseFireStoreService
        .myPatientsCollection(
            uId: CacheHelper.getData(key: 'myDoctorUid') ?? '')
        .doc('${CacheHelper.getData(key: 'patientId')}')
        .get();
    try {
      Map<String, dynamic> patientData =
          patientDoc.data() as Map<String, dynamic>;

      patient = UserModel(
        firstSessionDate: patientData['firstSessionDate'],
        address: patientData['address'],
        patientId: patientData['patientId'],
        fullName: patientData['fullName'],
        email: patientData['email'],
        phone: patientData['phone'],
        uId: patientData['uId'],
        userType: patientData['userType'],
        age: patientData['age'] ?? '',
        position: patientData['position'] ?? '',
        chiefComplain: patientData['chiefComplain'],
        suspectedInjury: patientData['suspectedInjury'],
        injuryRegion: patientData['injuryRegion'],
        gender: patientData['gender'],
      );
      CacheHelper.saveData(
        key: 'patientName',
        value: patient?.fullName,
      );

      return right(patient!);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchRadiology(
      {required int patientId}) async {
    radiology = [];
    QuerySnapshot<Map<String, dynamic>> exerciseSnapshot =
        await getRadiologyCollection(patientId: patientId);
    try {
      for (var element in exerciseSnapshot.docs) {
        radiology.add(element.data()['image']);
      }
      print(radiology.length);
      return right(radiology);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(failure);
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getRadiologyCollection(
      {required int patientId}) async {
    return await myFirebaseFireStoreService.doctorCollection
        .doc(doctorDocUid())
        .collection('myPatients')
        .doc('$patientId')
        .collection('Radiology')
        .get();
  }

  @override
  Future<Either<Failure, List<DetailsModel>>> fetchTreatment(
      {required int patientId}) async {
    treatment = [];
    QuerySnapshot<Map<String, dynamic>> exerciseSnapshot =
        await getTreatmentCollection(patientId: patientId);
    try {
      for (var element in exerciseSnapshot.docs) {
        treatment.add(DetailsModel.fromJson(element.data()));
      }

      return right(treatment);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(failure);
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getTreatmentCollection(
      {required int patientId}) async {
    return await myFirebaseFireStoreService.doctorCollection
        .doc(doctorDocUid())
        .collection('myPatients')
        .doc('$patientId')
        .collection('Exercises')
        .get();
  }

  String doctorDocUid() {
    if (CacheHelper.getData(key: 'userType') == 'userDoctor') {
      return CacheHelper.getData(key: 'uId');
    } else
      return CacheHelper.getData(key: 'myDoctorUid');
  }
}
