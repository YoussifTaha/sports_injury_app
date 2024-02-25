import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../logic/tests_cubit/tests_cubit_cubit.dart';
import 'tests.dart';

class InjuriesTestsListBlocBuilder extends StatelessWidget {
  const InjuriesTestsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InjuryTestsCubit, InjuryTestsState>(
      builder: (context, state) {
        if (state is InjuriesTestsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is InjuriesTestsSuccsses) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InjuryTests(
                  testsModel: state.tests[index],
                );
              },
              separatorBuilder: (context, index) => verticalSpace(20),
              itemCount: state.tests.length);
        } else if (state is InjuriesTestsError) {
          return Text(state.error);
        } else
          return Text('Unkown Error');
      },
    );
  }
}
