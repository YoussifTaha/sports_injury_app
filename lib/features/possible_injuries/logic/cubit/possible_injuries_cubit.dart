import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_injury_app/features/possible_injuries/data/models/injuries_model.dart';
import 'package:sports_injury_app/features/possible_injuries/data/repo/injury_repo.dart';

part 'possible_injuries_state.dart';

class PossibleInjuriesCubit extends Cubit<PossibleInjuriesState> {
  PossibleInjuriesCubit(this.injuriesRepo) : super(PossibleInjuriesInitial());

  static PossibleInjuriesCubit get(context) => BlocProvider.of(context);
  final InjuriesRepo injuriesRepo;

  Future<void> fetchInjuriesToTheRegion({required String regionName}) async {
    emit(PossibleInjuriesLoadingState());
    var result =
        await injuriesRepo.fetchInjuriesToTheRegion(regionName: regionName);
    result.fold((faliure) {
      emit(PossibleInjuriesError(error: faliure.message));
    }, (injuries) {
      emit(PossibleInjuriesSuccsses(injuries: injuries));
    });
  }

  Future<void> duplicateDocument() async {
    try {
      // Reference to the original document
      DocumentReference<Map<String, dynamic>> originalDocReference =
          FirebaseFirestore.instance.collection('regions').doc('Knee');

      // Get the data from the original document
      DocumentSnapshot<Map<String, dynamic>> originalDocSnapshot =
          await originalDocReference.get();

      // Check if the original document exists
      if (!originalDocSnapshot.exists) {
        print('Original document does not exist.');
        return;
      }

      // Reference to the new document with the specified ID
      CollectionReference<Map<String, dynamic>> newDocReference =
          FirebaseFirestore.instance
              .collection('regions')
              .doc('Ankle')
              .collection('Anatomy');

      // Set the data of the new document in the 'Anatomy' collection
      await newDocReference.add(originalDocSnapshot.data()!);

      // Reference to the new document in the 'Injuries' collection
      newDocReference = FirebaseFirestore.instance
          .collection('regions')
          .doc('Ankle')
          .collection('injuries');

      // Set the data of the new document in the 'Injuries' collection
      await newDocReference.add(originalDocSnapshot.data()!);

      print('Document duplicated successfully. New doc ID: Ankle');
    } catch (e) {
      print('Error duplicating document: $e');
    }
    try {
      // Reference to the original document
      DocumentReference<Map<String, dynamic>> originalDocReference =
          FirebaseFirestore.instance
              .collection('regions')
              .doc('Ankle')
              .collection('injuries')
              .doc('ACL Tear');

      // Get the data from the original document
      DocumentSnapshot<Map<String, dynamic>> originalDocSnapshot =
          await originalDocReference.get();

      // Check if the original document exists
      if (!originalDocSnapshot.exists) {
        print('Original document does not exist.');
        return;
      }

      // Reference to the new document with the specified ID
      CollectionReference<Map<String, dynamic>> newDocReference =
          FirebaseFirestore.instance
              .collection('regions')
              .doc('Ankle')
              .collection('injuries')
              .doc('ACL Tear')
              .collection('Mechanism');

      // Set the data of the new document in the 'Anatomy' collection
      await newDocReference.add(originalDocSnapshot.data()!);

      // Reference to the new document in the 'Injuries' collection
      newDocReference = FirebaseFirestore.instance
          .collection('regions')
          .doc('Ankle')
          .collection('injuries')
          .doc('ACL Tear')
          .collection('Special Tests');

      // Set the data of the new document in the 'Injuries' collection
      await newDocReference.add(originalDocSnapshot.data()!);

      newDocReference = FirebaseFirestore.instance
          .collection('regions')
          .doc('Ankle')
          .collection('injuries')
          .doc('ACL Tear')
          .collection('Treatment Program');

      // Set the data of the new document in the 'Injuries' collection
      await newDocReference.add(originalDocSnapshot.data()!);

      print('Document duplicated successfully');
    } catch (e) {
      print('Error duplicating document: $e');
    }
  }

//   Future<void> duplicateDocument() async {
//     final originalDocRef =
//         FirebaseFirestore.instance.collection('region').doc('Knee');
//     final newDocRef =
//         FirebaseFirestore.instance.collection('region').doc('Ankle');

//     // Step 1: Get original document data
//     final originalDocSnapshot = await originalDocRef.get();
//     final originalData = originalDocSnapshot.data();

//     if (originalData != null) {
//       // Step 2: Create new document
//       await newDocRef.set(originalData);
// print('Document duplicated successfully.');
//       // Step 3: Recursively duplicate subcollections
//       // await duplicateSubcollections(originalDocRef, newDocRef);
//     } else {print('Document duplicated false.');}
//   }

// Future<void> duplicateSubcollections(DocumentReference originalDocRef, DocumentReference newDocRef) async {
//   // Step 4: Get all subcollections of the original document
//   final originalCollections = await originalDocRef.collections();

//   // Recursively duplicate each subcollection and its documents
//   for (final originalCollectionRef in originalCollections) {
//     final newCollectionRef = newDocRef.collection(originalCollectionRef.id);
//     final originalDocs = await originalCollectionRef.get();

//     for (final originalDoc in originalDocs.docs) {
//       final originalDocData = originalDoc.data();
//       final newDocRef = newCollectionRef.doc(originalDoc.id);

//       // Duplicate document data
//       await newDocRef.set(originalDocData);

//       // Recursively duplicate subcollections
//       await duplicateSubcollections(originalDocRef.collection(originalCollectionRef.id).doc(originalDoc.id), newDocRef);
//     }
//   }
}
