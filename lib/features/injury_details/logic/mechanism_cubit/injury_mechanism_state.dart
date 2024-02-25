part of 'injury_mechanism_cubit.dart';

sealed class InjuryMechanismState extends Equatable {
  const InjuryMechanismState();

  @override
  List<Object> get props => [];
}

final class InjuryMechanismInitial extends InjuryMechanismState {}

final class InjuriesMechanismsLoadingState extends InjuryMechanismState {}

final class InjuriesMechanismsSuccsses extends InjuryMechanismState {
  final List<DetailsModel> mechanisms;

  InjuriesMechanismsSuccsses({required this.mechanisms});
}

final class InjuriesMechanismsError extends InjuryMechanismState {
  final String error;

  InjuriesMechanismsError({required this.error});
}
