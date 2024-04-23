import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/add_patient/logic/cubit/add_patient_cubit.dart';
import 'package:sports_injury_app/features/add_patient/ui/widgets/injuries_region_choice_row.dart';
import 'package:sports_injury_app/features/add_patient/ui/widgets/suspected_injuries.dart';

class InjuryRegionChoice extends StatelessWidget {
  const InjuryRegionChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPatientCubit, AddPatientState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Injury Region',
              style:
                  getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
            ),
            verticalSpace(20),
            InjuriesRegionChoiceRow(
                firstRegionName: 'Head And Neck', secondRegionName: 'Chest'),
            verticalSpace(30),
            InjuriesRegionChoiceRow(
                firstRegionName: 'Shoulder', secondRegionName: 'Knee'),
            verticalSpace(30),
            InjuriesRegionChoiceRow(
                firstRegionName: 'Wrist', secondRegionName: 'Ankle'),
            verticalSpace(30),
            InjuriesRegionChoiceRow(
                firstRegionName: 'Elbow', secondRegionName: 'Pelvis'),
            verticalSpace(30),
            Text(
              'Suspected Injury',
              style:
                  getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
            ),
            verticalSpace(10),
            Text(
              'You have to select an injury region first to add suspected injury',
              style: getRegularStyle(color: Colors.black, fontSize: 12.sp),
            ),
            verticalSpace(30),
            SuspectedInjuries(),
            verticalSpace(30),
          ],
        );
      },
    );
  }
}
