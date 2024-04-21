import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_injury_app/features/home/ui/widgets/patients_card.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetMyPatientsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetMyPatientsSuccsses) {
          if (state.patients.length != 0) {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PatientCard(
                    patient: state.patients[index],
                  );
                },
                separatorBuilder: (context, index) => horizontalSpace(10),
                itemCount: state.patients.length);
          } else
            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(10),
                  SizedBox(
                    height: 300.h,
                    child: Image.asset('assets/images/noPatient.png'),
                  ),
                  verticalSpace(15),
                  Text(
                    'You Haven\'t Added Patients Yet',
                    style: getMediumStyle(
                        color: ColorManger.darkPrimary, fontSize: 14.sp),
                  ),
                ],
              ),
            );
        } else if (state is GetMyPatientsError) {
          return Text(state.error);
        } else
          return Text('Unkown Error');
      },
    );
  }
}
