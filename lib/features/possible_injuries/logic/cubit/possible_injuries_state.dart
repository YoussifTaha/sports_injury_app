part of 'possible_injuries_cubit.dart';

@immutable
sealed class PossibleInjuriesState {}

final class PossibleInjuriesInitial extends PossibleInjuriesState {}

final class PossibleInjuriesLoadingState extends PossibleInjuriesState {}

final class PossibleInjuriesSuccsses extends PossibleInjuriesState {
  final List<InjuriesModel> injuries;

  PossibleInjuriesSuccsses({required this.injuries});
}

final class PossibleInjuriesError extends PossibleInjuriesState {
  final String error;

  PossibleInjuriesError({required this.error});
}
