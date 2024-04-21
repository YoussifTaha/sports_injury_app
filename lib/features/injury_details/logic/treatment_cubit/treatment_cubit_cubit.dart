import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/treatment/treatment_repo.dart';

import '../../data/models/details_model.dart';

part 'treatment_cubit_state.dart';

class InjuryTreatmentCubit extends Cubit<InjuryTreatmentState> {
  InjuryTreatmentCubit(this.treatmentRepo) : super(TreatmentCubitInitial());

  static InjuryTreatmentCubit get(context) => BlocProvider.of(context);

  final TreatmentRepo treatmentRepo;

  Future<void> fetchInjuriesTreatment(
      {required String regionName, required String injuryName}) async {
    emit(InjuriesTreatmentLoadingState());
    var result = await treatmentRepo.fetchInjuriesTreatment(
        regionName: regionName, injuryName: injuryName);
    result.fold((Failure) {
      emit(InjuriesTreatmentError(error: Failure.message));
    }, (treatment) {
      emit(InjuriesTreatmentSuccsses(treatment: treatment));
    });
  }
}
