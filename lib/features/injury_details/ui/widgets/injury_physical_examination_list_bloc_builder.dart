import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:sports_injury_app/features/injury_details/logic/physical_examination_cubit/physical_examination_cubit.dart';
import 'package:sports_injury_app/features/injury_details/ui/widgets/physical_examination.dart';
import '../../../../core/Helpers/spacing.dart';

class InjuriesPhysicalExaminationListBlocBuilder extends StatelessWidget {
  const InjuriesPhysicalExaminationListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InjuryPhysicalExaminationCubit,
        InjuryPhysicalExaminationState>(
      builder: (context, state) {
        if (state is InjuriesPhysicalExaminationLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is InjuriesPhysicalExaminationSuccsses) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InjuryPhysicalExamination(
                      physicalExaminationModel:
                          state.physicalExamination[index],
                    );
                  },
                  separatorBuilder: (context, index) => verticalSpace(20),
                  itemCount: state.physicalExamination.length),
              verticalSpace(20),
              myHorizontalDivider(),
              verticalSpace(20),
            ],
          );
        } else if (state is InjuriesPhysicalExaminationError) {
          return Text(state.error);
        } else
          return SizedBox.shrink();
      },
    );
  }
}
