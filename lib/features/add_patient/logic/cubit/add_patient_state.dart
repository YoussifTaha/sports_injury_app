part of 'add_patient_cubit.dart';

sealed class AddPatientState extends Equatable {
  const AddPatientState();

  @override
  List<Object> get props => [];
}

final class AddPatientInitial extends AddPatientState {}

final class AddPatientLoadingState extends AddPatientState {}

final class AddPatientSuccsses extends AddPatientState {
  final UserModel patient;

  AddPatientSuccsses({required this.patient});
}

final class AddPatientError extends AddPatientState {
  final String error;

  AddPatientError({required this.error});
}

final class AddPatientImagePicked extends AddPatientState {
  final List<XFile?>? images;

  AddPatientImagePicked({required this.images});
}

final class RemovePatientImage extends AddPatientState {
  final List<XFile?>? images;

  RemovePatientImage({required this.images});
}

final class NewInjuryRegionSuccsses extends AddPatientState {}

final class NewInjuryRegionLoading extends AddPatientState {}

final class FetchSuspectedInjuriesSuccsses extends AddPatientState {
  final List<String> suspectedInjuries;
  FetchSuspectedInjuriesSuccsses({required this.suspectedInjuries});
}

final class FetchSuspectedInjuriesError extends AddPatientState {
  final String error;
  FetchSuspectedInjuriesError({required this.error});
}
