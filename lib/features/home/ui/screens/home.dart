import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:sports_injury_app/features/home/logic/cubit/home_cubit.dart';
import 'package:sports_injury_app/features/home/ui/widgets/add_patient_card.dart';
import 'package:sports_injury_app/features/home/ui/widgets/common_injuries_regions.dart';
import 'package:sports_injury_app/features/home/ui/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/home/ui/widgets/patients_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeCubit.get(context)
        .fetchMyPatients(uId: '${CacheHelper.getData(key: 'uId')}');
    HomeCubit.get(context)
        .fetchDoctorName(uId: '${CacheHelper.getData(key: 'uId')}');
    super.initState();
  }

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
                    'Hello! ${CacheHelper.getData(key: 'doctorName') ?? 'Doctor'}',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                  verticalSpace(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddPatientCard(),
                      verticalSpace(20),
                      Text(
                        'Sports Physiotherapist\'s Bag',
                        style: getBoldStyle(
                            color: ColorManger.darkPrimary, fontSize: 18.sp),
                      ),
                      verticalSpace(10),
                      InkWell(
                        onTap: () {
                          context.pushNamed(Routes.bag);
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 350.w,
                              decoration: BoxDecoration(
                                color: ColorManger.lightBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        height: 53.h,
                                        width: 73.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Image.asset(
                                            'assets/icons/first-aid.png'),
                                      ),
                                    ],
                                  ),
                                  horizontalSpace(10),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'See What You Need Inside Your Physio Bag',
                                          style: getBoldStyle(
                                              color: ColorManger.darkPrimary,
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                        child: PatientsList(),
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
