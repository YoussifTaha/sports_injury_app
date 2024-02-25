part of 'treatment_cubit_cubit.dart';

sealed class InjuryTreatmentState extends Equatable {
  const InjuryTreatmentState();

  @override
  List<Object> get props => [];
}

final class TreatmentCubitInitial extends InjuryTreatmentState {}

final class InjuriesTreatmentLoadingState extends InjuryTreatmentState {}

final class InjuriesTreatmentSuccsses extends InjuryTreatmentState {
  final List<DetailsModel> treatment;

  InjuriesTreatmentSuccsses({required this.treatment});
}

final class InjuriesTreatmentError extends InjuryTreatmentState {
  final String error;

  InjuriesTreatmentError({required this.error});
}
