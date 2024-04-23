import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_injury_app/core/Helpers/cache_helper.dart';

class MyFirebaseFireStoreService {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<QuerySnapshot<Map<String, dynamic>>> getInjuriesCollection(
      {required String regionName}) async {
    return await FirebaseFirestore.instance
        .collection('regions')
        .doc(regionName)
        .collection('injuries')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAnatomyCollection(
      {required String regionName}) async {
    return await FirebaseFirestore.instance
        .collection('regions')
        .doc(regionName)
        .collection('Anatomy')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getInjuriesMechanismsCollection(
      {required String regionName, required String injuryName}) async {
    return await FirebaseFirestore.instance
        .collection('regions')
        .doc(regionName)
        .collection('injuries')
        .doc(injuryName)
        .collection('Mechanism')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>
      getInjuriesPhysicalExaminationCollection(
          {required String regionName,
          required String physicalExaminationName}) async {
    return await FirebaseFirestore.instance
        .collection('regions')
        .doc(regionName)
        .collection('injuries')
        .doc(physicalExaminationName)
        .collection('PhysicalExamination')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getInjuriesTestsCollection(
      {required String regionName, required String injuryName}) async {
    return await FirebaseFirestore.instance
        .collection('regions')
        .doc(regionName)
        .collection('injuries')
        .doc(injuryName)
        .collection('Special Tests')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getInjuriesTreatmentCollection(
      {required String regionName, required String injuryName}) async {
    return await FirebaseFirestore.instance
        .collection('regions')
        .doc(regionName)
        .collection('injuries')
        .doc(injuryName)
        .collection('Treatment Program')
        .get();
  }

  CollectionReference patientCollection = _firestore.collection('userPatient');
  CollectionReference doctorCollection = _firestore.collection('userDoctor');
  CollectionReference myPatientsCollection({required String uId}) {
    return _firestore
        .collection('userDoctor')
        .doc(uId)
        .collection('myPatients');
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getExercisesCollection() async {
    return await FirebaseFirestore.instance.collection('exercises').get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPatientsCollection() {
    return FirebaseFirestore.instance.collection('userPatient').snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMyPatientsCollection(
      {required String uid}) async {
    return await doctorCollection.doc(uid).collection('myPatients').get();
  }

  Future<DocumentSnapshot> getDoctorDoc({required String uid}) async {
    return await doctorCollection.doc(uid).get();
  }

  Future<DocumentSnapshot> getPatientDoc({required String uid}) async {
    return await patientCollection.doc(uid).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPatientExercisesCollection(
      {required int patientId}) async {
    return await doctorCollection
        .doc(CacheHelper.getData(key: 'uId'))
        .collection('myPatients')
        .doc('$patientId')
        .collection('Exercises')
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSuspectedInjuriesCollection(
      {required String injuryRegion}) async {
    return await _firestore
        .collection('regions')
        .doc(injuryRegion)
        .collection('injuries')
        .get();
  }
}
