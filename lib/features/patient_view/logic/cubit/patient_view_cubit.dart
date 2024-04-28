import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:sports_injury_app/features/patient_view/data/patient_view_repo.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_view_state.dart';

class PatientViewCubit extends Cubit<PatientViewState> {
  PatientViewCubit(this.patientsViewInfoRepo) : super(PatientViewInitial());

  static PatientViewCubit get(context) => BlocProvider.of(context);

  final PatientsViewInfoRepo patientsViewInfoRepo;

  Future<void> getBasicPatientInfo() async {
    emit(GetPatientBasicInfoLoadingState());
    var result = await patientsViewInfoRepo.getBasicPatientInfo();
    result.fold((faliure) {
      emit(GetPatientBasicInfoError(error: faliure.message));
    }, (patient) {
      emit(GetPatientBasicInfoSuccsses(patient: patient));
    });
  }

  Future<void> fetchRadiology({required int patientId}) async {
    emit(GetPatientRadiologyLoadingState());
    var result =
        await patientsViewInfoRepo.fetchRadiology(patientId: patientId);
    result.fold((faliure) {
      emit(GetPatientRadiologyError(error: faliure.message));
    }, (radiology) {
      emit(GetPatientRadiologySuccsses(radiology: radiology));
    });
  }

  Future<void> fetchTreatment({required int patientId}) async {
    emit(GetPatientRadiologyLoadingState());
    var result =
        await patientsViewInfoRepo.fetchTreatment(patientId: patientId);
    result.fold((faliure) {
      emit(GetPatientTreatmentError(error: faliure.message));
    }, (treatment) {
      emit(GetPatientTreatmentSuccsses(treatment: treatment));
    });
  }
}
