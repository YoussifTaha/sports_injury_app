import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/features/injury_details/data/repos/physical_examination/physical_examination_repo.dart';
import '../../data/models/details_model.dart';

part 'physical_examination_state.dart';

class InjuryPhysicalExaminationCubit
    extends Cubit<InjuryPhysicalExaminationState> {
  InjuryPhysicalExaminationCubit(this.physicalExaminationRepo)
      : super(InjuryPhysicalExaminationInitial());

  static InjuryPhysicalExaminationCubit get(context) =>
      BlocProvider.of(context);

  final PhysicalExaminationRepo physicalExaminationRepo;

  Future<void> fetchInjuriesPhysicalExamination(
      {required String regionName,
      required String physicalExaminationName}) async {
    emit(InjuriesPhysicalExaminationLoadingState());
    var result = await physicalExaminationRepo.fetchInjuriesPhysicalExamination(
        regionName: regionName,
        physicalExaminationName: physicalExaminationName);
    result.fold((Failure) {
      emit(InjuriesPhysicalExaminationError(error: Failure.message));
    }, (physicalExamination) {
      emit(InjuriesPhysicalExaminationSuccsses(
          physicalExamination: physicalExamination));
    });
  }
}
