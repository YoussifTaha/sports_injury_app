import 'package:firebase_core/firebase_core.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';

class FirebaseFireStoreException extends Failure {
  FirebaseFireStoreException(super.message);

  factory FirebaseFireStoreException.fromFirebaseFirestoreException(
      FirebaseException e) {
    if (e.code == 'permission-denied') {
      return FirebaseFireStoreException(
          'You Do Not Have The Permission To Acsses This Files');
    } else if (e.code == 'not-found') {
      return FirebaseFireStoreException(
          'The Object You Are Trying To Acsses Is Not Found');
    }
    return FirebaseFireStoreException(
        'An Error Occurred, Please Try Again Later');
  }
}
