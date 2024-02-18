import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/theming/colors.dart';

import '../../../../core/theming/styles_manager.dart';

class PlayerImage extends StatelessWidget {
  const PlayerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 430.w,
          height: 550.h,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [
                  0.14,
                  0.45
                ],
                colors: [
                  ColorManger.primary,
                  ColorManger.primary.withOpacity(0.0)
                ]),
          ),
          child: Image.asset('assets/images/player.png'),
        ),
        Positioned(
          bottom: 10,
          width: 350.w,
          child: Text(
            'FootBall Injuries Application',
            textAlign: TextAlign.center,
            style: getBoldStyle(color: Colors.white, fontSize: 32.sp),
          ),
        ),
      ],
    );
  }
}
