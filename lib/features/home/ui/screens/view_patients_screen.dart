import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/home/ui/widgets/patients_card.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context)
        .fetchMyPatients(uId: '${CacheHelper.getData(key: 'uId')}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Patients',
          style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(15),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is GetMyPatientsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetMyPatientsSuccsses) {
                if (state.patients.length != 0) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return PatientCard(
                        patient: state.patients[index],
                      );
                    },
                    separatorBuilder: (context, index) => verticalSpace(15),
                    itemCount: state.patients.length,
                  );
                } else
                  return Center(child: Text('No Patients Yet'));
              } else if (state is GetMyPatientsError) {
                return Text(state.error);
              } else
                return Text('Unkown Error');
            }),
          ),
        ],
      ),
    );
  }
}
