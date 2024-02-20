import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/routing/routes.dart';

import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class InjuryRegionItem extends StatelessWidget {
  final String regionName;
  const InjuryRegionItem({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(
              Routes.injuryRegionScreen,
              arguments: {'injuryRegion': regionName},
            );
          },
          child: Container(
            width: 85.w,
            height: 85.h,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorManger.lightBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/images/${regionName}.png'),
          ),
        ),
        verticalSpace(15),
        Text(
          regionName,
          style: getBoldStyle(color: ColorManger.darkPrimary, fontSize: 16.sp),
        ),
      ],
    );
  }
}
