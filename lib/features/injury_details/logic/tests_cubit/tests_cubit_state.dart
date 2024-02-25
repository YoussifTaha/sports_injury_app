part of 'tests_cubit_cubit.dart';

sealed class InjuryTestsState extends Equatable {
  const InjuryTestsState();

  @override
  List<Object> get props => [];
}

final class TestsCubitInitial extends InjuryTestsState {}

final class InjuriesTestsLoadingState extends InjuryTestsState {}

final class InjuriesTestsSuccsses extends InjuryTestsState {
  final List<DetailsModel> tests;

  InjuriesTestsSuccsses({required this.tests});
}

final class InjuriesTestsError extends InjuryTestsState {
  final String error;

  InjuriesTestsError({required this.error});
}
