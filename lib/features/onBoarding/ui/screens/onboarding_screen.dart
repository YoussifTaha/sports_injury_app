import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widgets/components.dart';
import '../widgets/player_image.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManger.primary,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.h),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpace(40),
                      const PlayerImage(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Follow up with your own physiotherapist and recover from your injury as soon as possible',
                          textAlign: TextAlign.center,
                          style: getRegularStyle(
                            color: Colors.white.withOpacity(0.8),
                            textHeight: 1.2.h,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      button(
                          textColor: ColorManger.primary,
                          height: 50,
                          context: context,
                          function: () {
                            context.pushNamed(Routes.loginScreen);
                          },
                          text: 'Get Started',
                          color: Colors.white)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
