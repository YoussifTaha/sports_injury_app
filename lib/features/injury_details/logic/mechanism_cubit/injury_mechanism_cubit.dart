import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/details_model.dart';
import '../../data/repos/mechanism/mechanism_repo.dart';

part 'injury_mechanism_state.dart';

class InjuryMechanismCubit extends Cubit<InjuryMechanismState> {
  InjuryMechanismCubit(this.mechanismRepo) : super(InjuryMechanismInitial());

  static InjuryMechanismCubit get(context) => BlocProvider.of(context);

  final MechanismRepo mechanismRepo;

  Future<void> fetchInjuriesMechanisms(
      {required String regionName, required String injuryName}) async {
    emit(InjuriesMechanismsLoadingState());
    var result = await mechanismRepo.fetchInjuriesMechanisms(
        regionName: regionName, injuryName: injuryName);
    result.fold((faliure) {
      emit(InjuriesMechanismsError(error: faliure.message));
    }, (mechanisms) {
      emit(InjuriesMechanismsSuccsses(mechanisms: mechanisms));
    });
  }
}
