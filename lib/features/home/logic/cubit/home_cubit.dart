import 'package:sports_injury_app/features/home/data/repos/home_repo.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchMyPatients({required String uId}) async {
    emit(GetMyPatientsLoadingState());
    var result = await homeRepo.fetchMyPatients(uId: uId);
    result.fold((faliure) {
      emit(GetMyPatientsError(error: faliure.message));
    }, (patients) {
      emit(GetMyPatientsSuccsses(patients: patients));
    });
  }

  Future<void> fetchDoctorName({required String uId}) async {
    await homeRepo.fetchDoctorName(uId: uId);
  }
}
