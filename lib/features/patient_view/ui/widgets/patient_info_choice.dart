import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';

class PatientInfoChoice extends StatelessWidget {
  final String choice;
  final String image;
  const PatientInfoChoice(
      {super.key, required this.choice, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 50,
      decoration: BoxDecoration(
        color: ColorManger.lessLightGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              SizedBox(
                  width: 40.w,
                  height: 60.h,
                  child: Image.asset('assets/images/$image.png')),
              horizontalSpace(20),
              Text(
                choice,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
