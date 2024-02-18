import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By signing Up, you agree to our',
            style:
                getRegularStyle(color: ColorManger.regularGrey, fontSize: 15),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: getMediumStyle(color: ColorManger.darkPrimary, fontSize: 15),
          ),
          TextSpan(
            text: ' and',
            style: getRegularStyle(
                color: ColorManger.regularGrey,
                textHeight: 1.5.h,
                fontSize: 15),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: getMediumStyle(color: ColorManger.darkPrimary, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
