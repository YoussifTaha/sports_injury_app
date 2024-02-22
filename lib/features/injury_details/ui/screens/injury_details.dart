import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:sports_injury_app/features/injury_details/ui/widgets/injury_mechanism.dart';
import 'package:sports_injury_app/features/injury_details/ui/widgets/tests.dart';
import 'package:sports_injury_app/features/injury_details/ui/widgets/treatment.dart';

import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class InjuryDetails extends StatelessWidget {
  final String injuryName;
  final String injuryImage;
  const InjuryDetails(
      {Key? key, required this.injuryName, required this.injuryImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$injuryName',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 22.sp),
              ),
              verticalSpace(20),
              Text(
                'ACL injuries are one of the most common injuries that occur in soccer (football) .They occur when the ACL loses its continuity. They can range from mild (such as small tears/sprain) to severe (when the ligament is completely torn).',
                style: getRegularStyle(
                    color: ColorManger.regularGrey.withOpacity(0.8),
                    fontSize: 14.sp,
                    textHeight: 1.1),
              ),
              verticalSpace(40),
              SizedBox(
                width: double.infinity,
                height: 150.h,
                child: CachedNetworkImage(imageUrl: injuryImage),
              ),
              verticalSpace(30),
              Text(
                'Note : Ask the patient for how he got his injury and show them the next mechanism so he can identify if this what happened for them',
                style: getRegularStyle(
                    color: ColorManger.regularGrey.withOpacity(0.8),
                    fontSize: 14.sp,
                    textHeight: 1.1),
              ),
              verticalSpace(10),
              Text(
                'Injury Mechanisms',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
              verticalSpace(20),
              InjuryMechanism(),
              verticalSpace(20),
              myHorizontalDivider(),
              verticalSpace(20),
              Text(
                'Special Tests',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
              verticalSpace(20),
              InjuryTests(),
              verticalSpace(20),
              myHorizontalDivider(),
              verticalSpace(20),
              Text(
                'Treatment Program',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
              verticalSpace(10),
              Treatment()
            ],
          ),
        ),
      ),
    );
  }
}
