import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/features/possible_injuries/data/models/injuries_model.dart';

import '../../../../core/Helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class PossibleInjuriesItem extends StatelessWidget {
  final String regionName;
  final InjuriesModel injuriesModel;
  const PossibleInjuriesItem({
    super.key,
    required this.injuriesModel,
    required this.regionName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.injuryDetails,
          arguments: {
            'regionName': regionName,
            'injuriesModel': injuriesModel,
          },
        );
      },
      child: Container(
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
                  child: CachedNetworkImage(imageUrl: '${injuriesModel.image}'),
                ),
              ],
            ),
            horizontalSpace(10),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  injuriesModel.name ?? '',
                  style: getBoldStyle(
                      color: ColorManger.darkPrimary, fontSize: 14.sp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
