part of 'patient_view_cubit.dart';

sealed class PatientViewState extends Equatable {
  const PatientViewState();

  @override
  List<Object> get props => [];
}

final class PatientViewInitial extends PatientViewState {}

final class GetPatientBasicInfoLoadingState extends PatientViewState {}

final class GetPatientBasicInfoSuccsses extends PatientViewState {
  final UserModel patient;

  GetPatientBasicInfoSuccsses({required this.patient});
}

final class GetPatientBasicInfoError extends PatientViewState {
  final String error;

  GetPatientBasicInfoError({required this.error});
}

final class GetPatientRadiologyLoadingState extends PatientViewState {}

final class GetPatientRadiologySuccsses extends PatientViewState {
  final List<String> radiology;

  GetPatientRadiologySuccsses({required this.radiology});
}

final class GetPatientRadiologyError extends PatientViewState {
  final String error;

  GetPatientRadiologyError({required this.error});
}

final class GetPatientTreatmentSuccsses extends PatientViewState {
  final List<DetailsModel> treatment;

  GetPatientTreatmentSuccsses({required this.treatment});
}

final class GetPatientTreatmentError extends PatientViewState {
  final String error;

  GetPatientTreatmentError({required this.error});
}
