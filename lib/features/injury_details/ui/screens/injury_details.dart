import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:sports_injury_app/features/injury_details/logic/tests_cubit/tests_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/logic/treatment_cubit/treatment_cubit_cubit.dart';
import 'package:sports_injury_app/features/possible_injuries/data/models/injuries_model.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';
import '../../logic/mechanism_cubit/injury_mechanism_cubit.dart';
import '../widgets/injury_mechanisms_list_bloc_builder.dart';
import '../widgets/injury_tests_list_bloc_builder.dart';
import '../widgets/injury_treatment_list_bloc_builder.dart';

class InjuryDetails extends StatefulWidget {
  final String regionName;
  final InjuriesModel injuriesModel;
  const InjuryDetails(
      {Key? key, required this.regionName, required this.injuriesModel})
      : super(key: key);

  @override
  State<InjuryDetails> createState() => _InjuryMechanismState();
}

class _InjuryMechanismState extends State<InjuryDetails> {
  @override
  void initState() {
    InjuryMechanismCubit.get(context).fetchInjuriesMechanisms(
        regionName: widget.regionName,
        injuryName: widget.injuriesModel.name ?? '');
    InjuryTestsCubit.get(context).fetchInjuriesTests(
        regionName: widget.regionName,
        injuryName: widget.injuriesModel.name ?? '');
    InjuryTreatmentCubit.get(context).fetchInjuriesTreatment(
        regionName: widget.regionName,
        injuryName: widget.injuriesModel.name ?? '');
    super.initState();
  }

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
                widget.injuriesModel.name ?? '',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 22.sp),
              ),
              verticalSpace(20),
              Text(
                widget.injuriesModel.description ?? '',
                style: getRegularStyle(
                    color: ColorManger.regularGrey.withOpacity(0.8),
                    fontSize: 14.sp,
                    textHeight: 1.1),
              ),
              verticalSpace(40),
              SizedBox(
                width: double.infinity,
                height: 150.h,
                child: CachedNetworkImage(
                    imageUrl: widget.injuriesModel.image ?? ''),
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
              InjuriesMechanismListBlocBuilder(),
              verticalSpace(20),
              myHorizontalDivider(),
              verticalSpace(20),
              Text(
                'Special Tests',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
              verticalSpace(20),
              InjuriesTestsListBlocBuilder(),
              verticalSpace(20),
              myHorizontalDivider(),
              verticalSpace(20),
              Text(
                'Treatment Program',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
              verticalSpace(10),
              widget.injuriesModel.treatmentDescription == ''
                  ? SizedBox.shrink()
                  : Text(
                      widget.injuriesModel.treatmentDescription ?? '',
                      style: getRegularStyle(
                          color: ColorManger.regularGrey,
                          fontSize: 14.sp,
                          textHeight: 1.2),
                    ),
              verticalSpace(20),
              InjuriesTreatmentListBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
