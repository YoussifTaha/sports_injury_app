import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/injury_region/ui/widgets/injury_info_category_row.dart';

import '../../../../core/routing/routes.dart';

class InjuryRegionScreen extends StatelessWidget {
  final String injuryRegion;
  const InjuryRegionScreen({Key? key, required this.injuryRegion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$injuryRegion Region',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 22.sp),
              ),
              verticalSpace(20),
              Text(
                'Important Information About The $injuryRegion Region',
                style: getMediumStyle(
                    color: ColorManger.regularGrey, fontSize: 14.sp),
              ),
              verticalSpace(30),
              SizedBox(
                width: double.infinity,
                height: 88.h,
                child: Image.asset('assets/images/$injuryRegion.png'),
              ),
              verticalSpace(30),
              InkWell(
                onTap: () {
                  context.pushNamed(
                    Routes.anatomy,
                    arguments: {'injuryRegion': injuryRegion},
                  );
                },
                child: InjuryInfoCategoryRow(
                  title: 'Anatomy',
                ),
              ),
              verticalSpace(20),
              InkWell(
                onTap: () {
                  context.pushNamed(
                    Routes.possibleInjuriescreen,
                    arguments: {'injuryRegion': injuryRegion},
                  );
                },
                child: InjuryInfoCategoryRow(
                  image: injuryRegion,
                  title: 'Possible Injuryies for $injuryRegion',
                ),
              ),
              verticalSpace(20),
            ],
          ),
        ));
  }
}
