import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/features/add_patient/logic/cubit/add_patient_cubit.dart';

class SuspectedInjuries extends StatefulWidget {
  const SuspectedInjuries({super.key});

  @override
  State<SuspectedInjuries> createState() => _SuspectedInjuriesState();
}

class _SuspectedInjuriesState extends State<SuspectedInjuries> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPatientCubit, AddPatientState>(
      builder: (context, state) {
        String? selectedinjury = AddPatientCubit.get(context).suspectedInjury;
        if (state is NewInjuryRegionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchSuspectedInjuriesSuccsses) {
          return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    AddPatientCubit.get(context).changeSuspectedInjury(
                        newInjury: state.suspectedInjuries[index]);
                    setState(() {});
                  },
                  child: Row(children: [
                    Expanded(child: Text('${state.suspectedInjuries[index]}')),
                    horizontalSpace(5),
                    Expanded(
                        child: Icon(
                            selectedinjury == state.suspectedInjuries[index]
                                ? Icons.radio_button_on_sharp
                                : Icons.radio_button_off_sharp,
                            color: ColorManger.primary)),
                  ]),
                );
              },
              separatorBuilder: (context, index) => verticalSpace(10),
              itemCount: state.suspectedInjuries.length);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
