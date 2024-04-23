import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';

class AddPhotoButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final IconData icon;
  const AddPhotoButton(
      {super.key,
      required this.text,
      required this.function,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side: MaterialStatePropertyAll(
              BorderSide(
                  style: BorderStyle.solid,
                  strokeAlign: -3.0,
                  width: 2.0,
                  color: ColorManger.primary),
            )),
        onPressed: function,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorManger.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            horizontalSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: ColorManger.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
