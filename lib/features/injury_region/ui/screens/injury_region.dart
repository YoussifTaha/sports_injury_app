import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/injury_region/ui/widgets/injury_info_category_row.dart';

class InjuryRegionScreen extends StatelessWidget {
  final String injuryRegion;
  const InjuryRegionScreen({Key? key, required this.injuryRegion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$injuryRegion Region',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 22.sp),
              ),
              verticalSpace(20),
              Text(
                'Important Information About The $injuryRegion Region',
                style: getMediumStyle(
                    color: ColorManger.regularGrey, fontSize: 14.sp),
              ),
              verticalSpace(30),
              SizedBox(
                width: double.infinity,
                height: 88.h,
                child: Image.asset('assets/images/$injuryRegion.png'),
              ),
              verticalSpace(30),
              InjuryInfoCategoryRow(
                image: 'Anatomy',
                title: 'Anatomy',
              ),
              verticalSpace(20),
              InjuryInfoCategoryRow(
                image: injuryRegion,
                title: 'Possible Injury Mechanisms',
              ),
              verticalSpace(20),
              InjuryInfoCategoryRow(
                image: 'Tests',
                title: 'Tests',
              ),
              verticalSpace(20),
              InjuryInfoCategoryRow(
                image: 'Exercises',
                title: 'Exercises',
              ),
              verticalSpace(20),
            ],
          ),
        ));
  }
}
