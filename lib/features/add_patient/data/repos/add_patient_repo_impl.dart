import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/core/networking/my_firebase_firestore_service.dart';
import 'package:sports_injury_app/features/add_patient/data/models/add_user_info_model.dart';
import 'package:sports_injury_app/features/add_patient/data/repos/add_patient_repo.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class AddPatientRepoImpl extends AddPatientRepo {
  UserModel? patient;
  List<String> injuries = [];

  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();
  @override
  Future<Either<Failure, UserModel>> fetchPatientUser(
      {required int patientId, required UserInfoModel patientInfo}) async {
    QuerySnapshot<Object?> patientQuery =
        await getPatientDataById(patientId: patientId);

    try {
      saveDataInUserModel(patientQuery: patientQuery, patientInfo: patientInfo);
      addPatientToMyPatientsCollection(patientId: patientId);
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
  Future<QuerySnapshot<Object?>> getPatientDataById(
      {required patientId}) async {
    QuerySnapshot patientQuery = await myFirebaseService.patientCollection
        .where('patientId', isEqualTo: patientId)
        .get();
    String patientDocID = patientQuery.docs.first.id;
    print('patientDocID: $patientDocID');
    await addDoctorUidToPatientDoc(patientDocID);
    return patientQuery;
  }

  @override
  Future<void> addDoctorUidToPatientDoc(String patientDocID) async {
    await myFirebaseService.patientCollection
        .doc(patientDocID)
        .update({'myDoctorUid': CacheHelper.getData(key: 'uId')});
    print('myDoctorUid: ${CacheHelper.getData(key: 'uId')}');
  }

  @override
  void saveDataInUserModel(
      {required QuerySnapshot<Object?> patientQuery,
      required UserInfoModel? patientInfo}) {
    Map<String, dynamic> patientData =
        patientQuery.docs.first.data() as Map<String, dynamic>;

    patient = UserModel(
      myDoctorUid: patientData['myDoctorUid'],
      patientId: patientData['patientId'],
      fullName: patientData['fullName'],
      email: patientData['email'],
      phone: patientData['phone'],
      uId: patientData['uId'],
      userType: patientData['userType'],
      firstSessionDate: patientInfo?.sessionDate,
      age: patientInfo?.age,
      position: patientInfo?.position,
      chiefComplain: patientInfo?.chiefComplain,
      injuryRegion: patientInfo?.injuryRegion,
      gender: patientInfo?.gender,
      suspectedInjury: patientInfo?.suspectedInjury,
    );
  }

  @override
  void addPatientToMyPatientsCollection({
    required int patientId,
  }) {
    CollectionReference myPatientsCollection = myFirebaseService
        .doctorCollection
        .doc('${CacheHelper.getData(key: 'uId')}')
        .collection('myPatients');
    myPatientsCollection.doc('$patientId').set(patient?.toJson());
  }

  @override
  Future<Either<Failure, List<String>>> fetchSuspectedInjuries(
      {required String injuryRegion}) async {
    injuries = [];
    QuerySnapshot<Map<String, dynamic>> injurySnapshot = await myFirebaseService
        .getSuspectedInjuriesCollection(injuryRegion: injuryRegion);
    try {
      for (var element in injurySnapshot.docs) {
        injuries.add(element.data()['name']);
        print(injuries);
      }
      print(injuries.length);
      return right(injuries);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(failure);
    }
  }

  @override
  void addAllTreatmentProgramToUserExercises(
      {required int patientId,
      required String injuryRegion,
      required String injury}) async {
    CollectionReference userExercisesCollection = myFirebaseService
        .doctorCollection
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('myPatients')
        .doc('$patientId')
        .collection('Exercises');

    QuerySnapshot<Map<String, dynamic>> treatmentProgramSnapshot =
        await myFirebaseService.getInjuriesTreatmentCollection(
            regionName: injuryRegion, injuryName: injury);

    treatmentProgramSnapshot.docs.forEach((doc) async {
      await userExercisesCollection.add(doc.data());
    });
  }

  void addPatientRadiology(
      {required int patientId, required List<String>? radiology}) {
    CollectionReference<Object?> exercisesCollection = myFirebaseService
        .doctorCollection
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('myPatients')
        .doc('$patientId')
        .collection('Radiology');
    ;

    radiology?.forEach((image) {
      exercisesCollection.doc().set({
        'image': image,
      });
    });
  }

  @override
  void uploadRadiologyImages(
      {required int patientId, List<XFile?>? radiologyImages}) {
    radiologyImages?.forEach((image) {
      File convertedImage = File(image!.path);
      Reference storagePath = FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(convertedImage.path).pathSegments.last}');
      storagePath.putFile(convertedImage).then((value) {
        value.ref.getDownloadURL().then((value) {
          addPatientRadiology(patientId: patientId, radiology: [value]);
        });
      });
    });
  }
}
