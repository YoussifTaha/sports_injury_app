import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../logic/tests_cubit/tests_cubit_cubit.dart';
import 'tests.dart';

class InjuriesTestsListBlocBuilder extends StatelessWidget {
  const InjuriesTestsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<InjuryTestsCubit, InjuryTestsState>(
          builder: (context, state) {
            if (state is InjuriesTestsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is InjuriesTestsSuccsses) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tests',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                  verticalSpace(10),
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InjuryTests(
                          testsModel: state.tests[index],
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpace(20),
                      itemCount: state.tests.length),
                ],
              );
            } else if (state is InjuriesTestsError) {
              return Text(state.error);
            } else
              return Text('Unkown Error');
          },
        ),
      ),
    );
  }
}
