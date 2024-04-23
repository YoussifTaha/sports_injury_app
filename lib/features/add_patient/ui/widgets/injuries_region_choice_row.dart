import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/features/add_patient/logic/cubit/add_patient_cubit.dart';

class InjuriesRegionChoiceRow extends StatelessWidget {
  final String firstRegionName;
  final String secondRegionName;
  const InjuriesRegionChoiceRow({
    super.key,
    required this.firstRegionName,
    required this.secondRegionName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPatientCubit, AddPatientState>(
      builder: (context, state) {
        String? selectedRegionName = AddPatientCubit.get(context).injuryRegion;
        return Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  AddPatientCubit.get(context)
                      .changeInjuryRegion(region: firstRegionName);
                  AddPatientCubit.get(context).fetchSuspectedInjuries();
                },
                child: Row(children: [
                  Expanded(child: Text('${firstRegionName}')),
                  horizontalSpace(5),
                  Expanded(
                      child: Icon(
                          selectedRegionName == firstRegionName
                              ? Icons.radio_button_on_sharp
                              : Icons.radio_button_off_sharp,
                          color: ColorManger.primary)),
                ]),
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: InkWell(
                onTap: () async {
                  AddPatientCubit.get(context)
                      .changeInjuryRegion(region: secondRegionName);
                  await AddPatientCubit.get(context).fetchSuspectedInjuries();
                },
                child: Row(children: [
                  Expanded(child: Text('${secondRegionName}')),
                  horizontalSpace(5),
                  Expanded(
                      child: Icon(
                          selectedRegionName == secondRegionName
                              ? Icons.radio_button_on_sharp
                              : Icons.radio_button_off_sharp,
                          color: ColorManger.primary)),
                ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
