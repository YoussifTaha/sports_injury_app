import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';

import '../../../../core/Helpers/spacing.dart';
import '../../logic/mechanism_cubit/injury_mechanism_cubit.dart';
import 'injury_mechanism.dart';

class InjuriesMechanismListBlocBuilder extends StatelessWidget {
  const InjuriesMechanismListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<InjuryMechanismCubit, InjuryMechanismState>(
          builder: (context, state) {
            if (state is InjuriesMechanismsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is InjuriesMechanismsSuccsses) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Injury Mechanisms',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                  verticalSpace(20),
                  Text(
                    'Note : Ask the patient for how he got his injury and show them the next mechanism so he can identify if this what happened for them',
                    style: getRegularStyle(
                        color: ColorManger.regularGrey.withOpacity(0.8),
                        fontSize: 14.sp,
                        textHeight: 1.1),
                  ),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InjuryMechanism(
                          mechanismModel: state.mechanisms[index],
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpace(20),
                      itemCount: state.mechanisms.length),
                ],
              );
            } else if (state is InjuriesMechanismsError) {
              return Text(state.error);
            } else
              return Text('Unkown Error');
          },
        ),
      ),
    );
  }
}
