import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';

import '../widgets/possible_injuries_item.dart';

class PossibleInjuriescreen extends StatelessWidget {
  final String injuryRegion;
  const PossibleInjuriescreen({Key? key, required this.injuryRegion})
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
                  'Possible Injuries to the $injuryRegion',
                  style: getBoldStyle(
                      color: ColorManger.darkPrimary, fontSize: 22.sp),
                ),
                verticalSpace(10),
                Text(
                  'Each one of these injuries have information that include possible injury mechanisms to the $injuryRegion and the tests to confirm them and the exercises program to recover from it.',
                  style: getRegularStyle(
                      color: ColorManger.regularGrey.withOpacity(0.8),
                      fontSize: 14.sp,
                      textHeight: 1.1),
                ),
                verticalSpace(30),

                // These InjuryInfoCategoryRows are just implmented that way to evaluate the UI untill the data is fetched
                // TODO make it listView

                PossibleInjuriesItem(
                  image:
                      'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/acl-tear.png',
                  title: 'ACL',
                ),
                verticalSpace(15),
                PossibleInjuriesItem(
                  image:
                      'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/PCL-Tear.png',
                  title: 'PCL',
                ),
                verticalSpace(15),
                PossibleInjuriesItem(
                  image:
                      'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/what-is-the-difference-between-an-acl-tear-and-an-mcl-tear-2.png',
                  title: 'MCL',
                ),
                verticalSpace(15),
                PossibleInjuriesItem(
                  image:
                      'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/Desktop%20Screenshot%202024.02.20%20-%2019.45.58.53.png',
                  title: 'LCL',
                ),
                verticalSpace(15),
                PossibleInjuriesItem(
                  image:
                      'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/patellofemoral-pain-syndrome.png',
                  title: 'Patellofemoral Pain Syndrome',
                ),
                verticalSpace(15),
                PossibleInjuriesItem(
                  image:
                      'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/3D-rendering-of-meniscus-tear.png',
                  title: 'Meniscal Injury',
                ),
                verticalSpace(15),
                PossibleInjuriesItem(
                  image:
                      'https://raw.githubusercontent.com/madjoz60/sports_injury_app_images/main/Desktop%20Screenshot%202024.02.20%20-%2019.32.30.09.png',
                  title: 'Quadriceps & Hamstring Strains',
                ),
                verticalSpace(15),
              ],
            ),
          ),
        ));
  }
}
