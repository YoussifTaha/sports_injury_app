import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/patient_view/ui/widgets/patient_view_basic_info.dart';
import 'package:sports_injury_app/features/patient_view/ui/widgets/patient_view_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const PatientViewDrawer(),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Text(
                    'Hello! ${CacheHelper.getData(key: 'patientName') ?? ''}',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                ),
                verticalSpace(20),
                PatientViewBasicInfo(),
                verticalSpace(20),
              ],
            ),
          )),
    );
  }
}
