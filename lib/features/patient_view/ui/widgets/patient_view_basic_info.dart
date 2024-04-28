import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/patient_view/logic/cubit/patient_view_cubit.dart';
import 'package:sports_injury_app/features/patient_view/ui/widgets/patient_info_choice.dart';
import 'package:sports_injury_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientViewBasicInfo extends StatefulWidget {
  const PatientViewBasicInfo({super.key});

  @override
  State<PatientViewBasicInfo> createState() => _PatientViewBasicInfoState();
}

class _PatientViewBasicInfoState extends State<PatientViewBasicInfo> {
  @override
  void initState() {
    super.initState();
    PatientViewCubit.get(context).getBasicPatientInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientViewCubit, PatientViewState>(
        builder: (context, state) {
      if (state is GetPatientBasicInfoLoadingState) {
        return Center(
            child: CircularProgressIndicator(
          color: ColorManger.primary,
        ));
      } else if (state is GetPatientBasicInfoSuccsses) {
        UserModel patient = state.patient;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: horizontalSpace(1),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          patient.fullName,
                          style: getBoldStyle(
                              color: Colors.black, fontSize: 15.sp),
                        ),
                        verticalSpace(10),
                        Text(
                          'Age : ${patient.age} |  Position : ${patient.position}',
                          style: getMediumStyle(
                              color: ColorManger.regularGrey, fontSize: 13.sp),
                        ),
                        verticalSpace(8),
                        Text(
                          'Address : ${patient.address}',
                          style: getRegularStyle(
                              color: ColorManger.regularGrey.withOpacity(0.8),
                              fontSize: 11.sp),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: horizontalSpace(1),
                  ),
                ],
              ),
              verticalSpace(30),
              Text(
                'Chief Complain : ${patient.chiefComplain}',
                style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
              ),
              verticalSpace(10),
              Text(
                'Injury Date : ${patient.firstSessionDate}',
                style: getRegularStyle(
                    color: ColorManger.regularGrey, fontSize: 15.sp),
              ),
              verticalSpace(30),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.patientViewRadiology,
                      arguments: {'patientId': state.patient.patientId});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PatientInfoChoice(
                      choice: 'Patient Radilogy', image: 'Tests'),
                ),
              ),
              verticalSpace(20),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.patientViewTreatment,
                      arguments: {'patientId': state.patient.patientId});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: PatientInfoChoice(
                      choice: 'Patient Treatment Program', image: 'capsule'),
                ),
              ),
            ],
          ),
        );
      } else if (state is GetPatientBasicInfoError) {
        return Center(child: Text('${state.error}'));
      } else
        return Center(child: Text('UnkownError'));
    });
  }
}
