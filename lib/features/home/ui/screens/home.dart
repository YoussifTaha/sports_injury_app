import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:sports_injury_app/features/home/ui/widgets/add_patient_card.dart';
import 'package:sports_injury_app/features/home/ui/widgets/common_injuries_regions.dart';
import 'package:sports_injury_app/features/home/ui/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/home/ui/widgets/patients_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const HomeDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                );
              },
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello! Doctor Mohamed',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                  verticalSpace(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddPatientCard(),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Patients',
                            style: getBoldStyle(
                                color: ColorManger.darkPrimary,
                                fontSize: 18.sp),
                          ),
                          Text(
                            'View All',
                            style: getRegularStyle(
                                    color: ColorManger.primary,
                                    fontSize: 12.sp,
                                    textHeight: 1.2.h)
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      verticalSpace(15),
                      SizedBox(
                        height: 380,
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return PatientCard();
                            },
                            separatorBuilder: (context, index) =>
                                verticalSpace(15),
                            itemCount: 3),
                      ),
                      myHorizontalDivider(),
                      verticalSpace(25),
                      CommonInjuriesRegions(),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
