import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Helpers/spacing.dart';
import '../../logic/mechanism_cubit/injury_mechanism_cubit.dart';
import 'injury_mechanism.dart';

class InjuriesMechanismListBlocBuilder extends StatelessWidget {
  const InjuriesMechanismListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InjuryMechanismCubit, InjuryMechanismState>(
      builder: (context, state) {
        if (state is InjuriesMechanismsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is InjuriesMechanismsSuccsses) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InjuryMechanism(
                  mechanismModel: state.mechanisms[index],
                );
              },
              separatorBuilder: (context, index) => verticalSpace(20),
              itemCount: state.mechanisms.length);
        } else if (state is InjuriesMechanismsError) {
          return Text(state.error);
        } else
          return Text('Unkown Error');
      },
    );
  }
}
