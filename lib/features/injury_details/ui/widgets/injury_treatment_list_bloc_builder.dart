import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/injury_details/logic/treatment_cubit/treatment_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/ui/widgets/treatment.dart';
import '../../../../core/Helpers/spacing.dart';

class InjuriesTreatmentListBlocBuilder extends StatelessWidget {
  const InjuriesTreatmentListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<InjuryTreatmentCubit, InjuryTreatmentState>(
        builder: (context, state) {
          if (state is InjuriesTreatmentLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is InjuriesTreatmentSuccsses) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Treatment Program',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                  verticalSpace(20),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Treatment(
                          treatmentModel: state.treatment[index],
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpace(10),
                      itemCount: state.treatment.length),
                ],
              ),
            );
          } else if (state is InjuriesTreatmentError) {
            return Text(state.error);
          } else
            return Text('Unkown Error');
        },
      ),
    );
  }
}
