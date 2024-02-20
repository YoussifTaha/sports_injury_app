import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/features/home/ui/widgets/injuries_region_row.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class CommonInjuriesRegions extends StatelessWidget {
  const CommonInjuriesRegions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Common Injuries Region',
          style: getBoldStyle(color: ColorManger.darkPrimary, fontSize: 18.sp),
        ),
        verticalSpace(30),
        InjuriesRegionRow(
            firstRegionName: 'Head And Neck', secondRegionName: 'Chest'),
        verticalSpace(30),
        InjuriesRegionRow(
            firstRegionName: 'Shoulder', secondRegionName: 'Knee'),
        verticalSpace(30),
        InjuriesRegionRow(firstRegionName: 'Wrist', secondRegionName: 'Ankle'),
        verticalSpace(30),
        InjuriesRegionRow(firstRegionName: 'Elbow', secondRegionName: 'Pelvis'),
        verticalSpace(30),
      ],
    );
  }
}
