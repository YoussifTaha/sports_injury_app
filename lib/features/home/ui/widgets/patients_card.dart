import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 350.w,
          decoration: BoxDecoration(
            color: ColorManger.lightBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    color: ColorManger.primary,
                    size: 60,
                  ),
                ],
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohamed Ahmed',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16.sp),
                    ),
                    verticalSpace(5),
                    Text(
                      'Age : 27',
                      style: getBoldStyle(
                          color: ColorManger.regularGrey.withOpacity(0.7),
                          fontSize: 12.sp),
                    ),
                    verticalSpace(5),
                    Text(
                      'Gender : Male',
                      style: getBoldStyle(
                          color: ColorManger.regularGrey.withOpacity(0.7),
                          fontSize: 12.sp),
                    ),
                    verticalSpace(5),
                    Text(
                      'Position : Attack',
                      style: getBoldStyle(
                          color: ColorManger.regularGrey.withOpacity(0.7),
                          fontSize: 12.sp),
                    ),
                    verticalSpace(10),
                  ],
                ),
              ),
              Column(
                children: [
                  myVerticalDivider(height: 80),
                ],
              ),
              horizontalSpace(15),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 53.h,
                    width: 73.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset('assets/images/Knee.png'),
                  ),
                  verticalSpace(10),
                  Text(
                    'ACL',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
