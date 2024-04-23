import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';

class PatientCard extends StatelessWidget {
  final UserModel patient;
  const PatientCard({super.key, required this.patient});

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
          child: Column(
            children: [
              Row(
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
                          patient.fullName,
                          style: getBoldStyle(
                              color: ColorManger.darkPrimary, fontSize: 16.sp),
                        ),
                        verticalSpace(5),
                        Text(
                          'Age : ${patient.age}',
                          style: getBoldStyle(
                              color: ColorManger.regularGrey.withOpacity(0.7),
                              fontSize: 12.sp),
                        ),
                        verticalSpace(5),
                        Text(
                          'Gender : ${patient.gender}',
                          style: getBoldStyle(
                              color: ColorManger.regularGrey.withOpacity(0.7),
                              fontSize: 12.sp),
                        ),
                        verticalSpace(5),
                        Text(
                          'Position : ${patient.position}',
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
                        child: Image.asset(
                            'assets/images/${patient.injuryRegion}.png'),
                      ),
                      verticalSpace(10),
                      Text(
                        '${patient.suspectedInjury}',
                        style: getBoldStyle(
                            color: ColorManger.darkPrimary, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
              // verticalSpace(15),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         children: [
              //           button(
              //               context: context,
              //               function: () {},
              //               text: 'Add Injury Program'),
              //         ],
              //       ),
              //     ),
              // horizontalSpace(10),
              // Expanded(
              //   child: Column(
              //     children: [
              //       outlinedButton(
              //           height: 52.h,
              //           function: () {},
              //           text: 'Add Exercise'),
              //     ],
              //   ),
              // ),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
