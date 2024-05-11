import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/injury_details/logic/cubit/injury_details_cubit.dart';
import 'package:sports_injury_app/features/injury_details/logic/physical_examination_cubit/physical_examination_cubit.dart';
import 'package:sports_injury_app/features/injury_details/logic/tests_cubit/tests_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/logic/treatment_cubit/treatment_cubit_cubit.dart';
import 'package:sports_injury_app/features/injury_details/ui/widgets/details_type_choice.dart';
import 'package:sports_injury_app/features/injury_details/ui/widgets/injury_physical_examination_list_bloc_builder.dart';
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
  PageController pageController = PageController();
  @override
  void initState() {
    InjuryMechanismCubit.get(context).fetchInjuriesMechanisms(
        regionName: widget.regionName,
        injuryName: widget.injuriesModel.name ?? '');
    InjuryTestsCubit.get(context).fetchInjuriesTests(
        regionName: widget.regionName,
        injuryName: widget.injuriesModel.name ?? '');
    InjuryPhysicalExaminationCubit.get(context)
        .fetchInjuriesPhysicalExamination(
            regionName: widget.regionName,
            physicalExaminationName: widget.injuriesModel.name ?? '');
    InjuryTreatmentCubit.get(context).fetchInjuriesTreatment(
        regionName: widget.regionName,
        injuryName: widget.injuriesModel.name ?? '');
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<InjuryDetailsCubit, InjuryDetailsState>(
        builder: (context, state) {
          var cubit = InjuryDetailsCubit.get(context);
          String injuryDetailsTitle = cubit.injuryDetailsTitle;
          return PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              print('injuryDetailsTitle : $injuryDetailsTitle');
              if (index == 0) {
                return SingleChildScrollView(
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
                        InkWell(
                          onTap: () {
                            cubit.changeinjuryDetailsScreenPageView(
                                newDetailsTitle: 'Physical Examination',
                                pageController: pageController);
                          },
                          child: DetailsTypeChoice(choice: 'Injury Details'),
                        ),
                        verticalSpace(20),
                        InkWell(
                          onTap: () {
                            cubit.changeinjuryDetailsScreenPageView(
                                newDetailsTitle: 'mechanism',
                                pageController: pageController);
                          },
                          child: DetailsTypeChoice(choice: 'Injury Mechanism'),
                        ),
                        verticalSpace(20),
                        InkWell(
                          onTap: () {
                            cubit.changeinjuryDetailsScreenPageView(
                                newDetailsTitle: 'tests',
                                pageController: pageController);
                          },
                          child: DetailsTypeChoice(choice: 'Injury Tests'),
                        ),
                        verticalSpace(30),
                        Text(
                          'Treatment',
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
                        verticalSpace(10),
                        InkWell(
                          onTap: () {
                            cubit.changeinjuryDetailsScreenPageView(
                                newDetailsTitle: 'treatment',
                                pageController: pageController);
                          },
                          child: DetailsTypeChoice(choice: 'Injury Treatment'),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                switch (injuryDetailsTitle) {
                  case 'mechanism':
                    return InjuriesMechanismListBlocBuilder();
                  case 'tests':
                    return InjuriesTestsListBlocBuilder();
                  case 'Physical Examination':
                    return InjuriesPhysicalExaminationListBlocBuilder();
                  default:
                    return InjuriesTreatmentListBlocBuilder();
                }
              }
            },
            itemCount: 2,
          );
        },
      ),
    );
  }
}
