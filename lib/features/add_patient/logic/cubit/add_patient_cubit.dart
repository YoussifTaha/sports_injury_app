import 'package:image_picker/image_picker.dart';
import 'package:sports_injury_app/features/add_patient/data/models/add_user_info_model.dart';
import 'package:sports_injury_app/features/add_patient/data/repos/add_patient_repo.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_patient_state.dart';

class AddPatientCubit extends Cubit<AddPatientState> {
  AddPatientCubit(this.addPatientRepo) : super(AddPatientInitial());
  final AddPatientRepo addPatientRepo;

  static AddPatientCubit get(context) => BlocProvider.of(context);

  String? injuryRegion;
  String? suspectedInjury;

  void changeInjuryRegion({required String region}) {
    injuryRegion = region;
    emit(NewInjuryRegionSuccsses());
    emit(NewInjuryRegionLoading());
  }

  void changeSuspectedInjury({required String newInjury}) {
    suspectedInjury = newInjury;
  }

  Future<void> fetchPatientUser(
      {required int patientId, required UserInfoModel patientInfo}) async {
    emit(AddPatientLoadingState());
    var result = await addPatientRepo.fetchPatientUser(
        patientId: patientId, patientInfo: patientInfo);
    result.fold((faliure) {
      emit(AddPatientError(error: faliure.message));
    }, (patient) {
      emit(AddPatientSuccsses(patient: patient));
    });
  }

  final ImagePicker picker = ImagePicker();

  List<XFile?>? images = [];
  List<String>? imagesPath = [];

  Future<void> pickImageFromGallery() async {
    final galleryImages = await picker.pickMultiImage();
    images = galleryImages;
    imagesPath!.addAll(images!.map((e) => e!.path));
    emit(AddPatientImagePicked(images: galleryImages));
    emit(AddPatientInitial());
  }

  Future<void> pickImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    images!.add(photo!);
    emit(AddPatientImagePicked(images: images));
    emit(AddPatientInitial());
  }

  void removeImage({required XFile? image}) {
    images!.remove(image!);
    emit(RemovePatientImage(images: images));
    emit(AddPatientInitial());
  }

  void uploadRadiologyImages({
    required int patientId,
  }) {
    addPatientRepo.uploadRadiologyImages(
        patientId: patientId, radiologyImages: images);
  }

  Future<void> fetchSuspectedInjuries() async {
    var result = await addPatientRepo.fetchSuspectedInjuries(
        injuryRegion: injuryRegion ?? '');
    result.fold((faliure) {
      emit(FetchSuspectedInjuriesError(error: faliure.message));
    }, (suspectedInjuries) {
      emit(
          FetchSuspectedInjuriesSuccsses(suspectedInjuries: suspectedInjuries));
    });
  }

  void addAllTreatmentProgramToUserExercises({
    required int patientId,
  }) {
    addPatientRepo.addAllTreatmentProgramToUserExercises(
        patientId: patientId,
        injuryRegion: injuryRegion ?? '',
        injury: suspectedInjury ?? '');
  }
}
