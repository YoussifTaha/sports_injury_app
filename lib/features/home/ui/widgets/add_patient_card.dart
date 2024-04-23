import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../../../core/widgets/widgets.dart';

class AddPatientCard extends StatelessWidget {
  const AddPatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              height: 210.h,
              width: 380.w,
              'assets/images/cyanBackground.png',
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CachedNetworkImage(
                width: 160.w,
                height: 250.h,
                imageUrl:
                    'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/injuredPlayer2.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 125),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpace(15),
                    Text(
                      'Add new patients \nprofiles and help\nthem recover \nas soon as possible',
                      style: getBoldStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          textHeight: 1.2),
                    ),
                    verticalSpace(15),
                    button(
                        height: 35.h,
                        textColor: ColorManger.primary,
                        color: Colors.white,
                        fontSize: 12.sp,
                        width: 165.h,
                        context: context,
                        function: () {
                          context.pushNamed(Routes.addBasicInfoScreen);
                        },
                        text: 'Add New Patient'),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
