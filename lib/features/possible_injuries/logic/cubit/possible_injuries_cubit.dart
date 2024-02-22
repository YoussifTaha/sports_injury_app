import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_injury_app/features/possible_injuries/data/models/injuries_model.dart';
import 'package:sports_injury_app/features/possible_injuries/data/repo/injury_repo.dart';

part 'possible_injuries_state.dart';

class PossibleInjuriesCubit extends Cubit<PossibleInjuriesState> {
  PossibleInjuriesCubit(this.injuriesRepo) : super(PossibleInjuriesInitial());

  static PossibleInjuriesCubit get(context) => BlocProvider.of(context);
  final InjuriesRepo injuriesRepo;

  Future<void> fetchInjuriesToTheRegion({required String regionName}) async {
    emit(PossibleInjuriesLoadingState());
    var result =
        await injuriesRepo.fetchInjuriesToTheRegion(regionName: regionName);
    result.fold((faliure) {
      emit(PossibleInjuriesError(error: faliure.message));
    }, (injuries) {
      emit(PossibleInjuriesSuccsses(injuries: injuries));
    });
  }
}
