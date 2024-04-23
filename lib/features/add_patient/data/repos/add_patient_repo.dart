import 'package:image_picker/image_picker.dart';
import 'package:sports_injury_app/features/add_patient/data/models/add_user_info_model.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';

abstract class AddPatientRepo {
  Future<Either<Failure, UserModel>> fetchPatientUser(
      {required int patientId, required UserInfoModel patientInfo});

  Future<QuerySnapshot<Object?>> getPatientDataById({required patientId});

  Future<void> addDoctorUidToPatientDoc(String patientDocID);
  void saveDataInUserModel(
      {required QuerySnapshot<Object?> patientQuery,
      required UserInfoModel? patientInfo});

  void addPatientToMyPatientsCollection({
    required int patientId,
  });

  Future<Either<Failure, List<String>>> fetchSuspectedInjuries(
      {required String injuryRegion});

  void addAllTreatmentProgramToUserExercises(
      {required int patientId,
      required String injuryRegion,
      required String injury});

  void uploadRadiologyImages(
      {required int patientId, List<XFile?>? radiologyImages});
}
