part of 'physical_examination_cubit.dart';

sealed class InjuryPhysicalExaminationState extends Equatable {
  const InjuryPhysicalExaminationState();

  @override
  List<Object> get props => [];
}

final class InjuryPhysicalExaminationInitial
    extends InjuryPhysicalExaminationState {}

final class InjuriesPhysicalExaminationLoadingState
    extends InjuryPhysicalExaminationState {}

final class InjuriesPhysicalExaminationSuccsses
    extends InjuryPhysicalExaminationState {
  final List<DetailsModel> physicalExamination;

  InjuriesPhysicalExaminationSuccsses({required this.physicalExamination});
}

final class InjuriesPhysicalExaminationError
    extends InjuryPhysicalExaminationState {
  final String error;

  InjuriesPhysicalExaminationError({required this.error});
}
