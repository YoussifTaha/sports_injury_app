part of 'injury_details_cubit.dart';

sealed class InjuryDetailsState extends Equatable {
  const InjuryDetailsState();

  @override
  List<Object> get props => [];
}

final class InjuryDetailsInitial extends InjuryDetailsState {}

final class DetailsNewScreenState extends InjuryDetailsState {}
