import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/errors/faliure.dart';
import 'package:sports_injury_app/features/signup/data/repos/signup_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepoImpl extends SignUpRepo {
  @override
  Future<Either<Failure, UserCredential>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CacheHelper.saveData(key: 'uId', value: userCredential.user!.uid);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      FirebaseFailure failure = FirebaseFailure.fromFireBaseAuthError(e);
      return left(
        failure,
      );
    }
  }
}
