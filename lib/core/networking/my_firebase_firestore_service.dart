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
}
