import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/features/possible_injuries/logic/cubit/possible_injuries_cubit.dart';
import 'package:sports_injury_app/features/possible_injuries/ui/widgets/possible_injuries_item.dart';

class PossibleInjuriesListBlocBuilder extends StatelessWidget {
  const PossibleInjuriesListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PossibleInjuriesCubit, PossibleInjuriesState>(
        builder: (context, state) {
      if (state is PossibleInjuriesLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is PossibleInjuriesSuccsses) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PossibleInjuriesItem(injuriesModel: state.injuries[index]);
          },
          itemCount: state.injuries.length,
          separatorBuilder: (context, index) => verticalSpace(10),
        );
      } else if (state is PossibleInjuriesError) {
        return Text(state.error);
      } else
        return Text('Unknown Error');
    });
  }
}
