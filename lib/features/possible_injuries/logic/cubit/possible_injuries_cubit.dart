import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
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
    result.fold((Failure) {
      emit(PossibleInjuriesError(error: Failure.message));
    }, (injuries) {
      emit(PossibleInjuriesSuccsses(injuries: injuries));
    });
  }

  Future<void> fetchRegionAnatomy({required String regionName}) async {
    emit(PossibleInjuriesLoadingState());
    var result = await injuriesRepo.fetchRegionAnatomy(regionName: regionName);
    result.fold((Failure) {
      emit(FetchAnatomyError(error: Failure.message));
    }, (anatomy) {
      emit(FetchAnatomySuccsses(anatomy: anatomy));
    });
  }
}
