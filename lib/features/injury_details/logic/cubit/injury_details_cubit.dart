import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'injury_details_state.dart';

class InjuryDetailsCubit extends Cubit<InjuryDetailsState> {
  InjuryDetailsCubit() : super(InjuryDetailsInitial());

  static InjuryDetailsCubit get(context) => BlocProvider.of(context);

  String injuryDetailsTitle = 'treatment';

  void changeinjuryDetailsScreenPageView(
      {required String newDetailsTitle,
      required PageController pageController}) {
    changeinjuryDetailsTitle(newDetailsTitle: newDetailsTitle);
    animateToPage(pageController);
    emit(DetailsNewScreenState());
    emit(InjuryDetailsInitial());
  }

  void animateToPage(PageController pageController) {
    pageController.animateToPage(1,
        duration: Duration(milliseconds: 800.toInt()),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void changeinjuryDetailsTitle({required String newDetailsTitle}) {
    injuryDetailsTitle = newDetailsTitle;
  }
}
