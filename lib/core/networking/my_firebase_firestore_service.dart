import 'package:cloud_firestore/cloud_firestore.dart';

class MyFirebaseFireStoreService {
  Future<QuerySnapshot<Map<String, dynamic>>> getInjuriesCollection(
      {required String regionName}) async {
    return await FirebaseFirestore.instance
        .collection('regions')
        .doc(regionName)
        .collection('injuries')
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
}
