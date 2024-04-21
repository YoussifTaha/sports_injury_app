import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/tests/tests_repo.dart';

import '../../data/models/details_model.dart';

part 'tests_cubit_state.dart';

class InjuryTestsCubit extends Cubit<InjuryTestsState> {
  InjuryTestsCubit(this.testsRepo) : super(TestsCubitInitial());

  static InjuryTestsCubit get(context) => BlocProvider.of(context);

  final TestsRepo testsRepo;

  Future<void> fetchInjuriesTests(
      {required String regionName, required String injuryName}) async {
    emit(InjuriesTestsLoadingState());
    var result = await testsRepo.fetchInjuriesTests(
        regionName: regionName, injuryName: injuryName);
    result.fold((Failure) {
      emit(InjuriesTestsError(error: Failure.message));
    }, (tests) {
      emit(InjuriesTestsSuccsses(tests: tests));
    });
  }
}
