import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class PossibleInjuriesItem extends StatelessWidget {
  final String title;
  final String? image;
  const PossibleInjuriesItem({
    super.key,
    required this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: ColorManger.lightBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          horizontalSpace(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                height: 50.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CachedNetworkImage(imageUrl: '$image'),
              ),
            ],
          ),
          horizontalSpace(10),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 14.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
