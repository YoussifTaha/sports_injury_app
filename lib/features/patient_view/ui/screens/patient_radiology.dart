import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/patient_view/logic/cubit/patient_view_cubit.dart';

class PatientRadiology extends StatefulWidget {
  final int patientId;
  const PatientRadiology({super.key, required this.patientId});

  @override
  State<PatientRadiology> createState() => _PatientRadiologyState();
}

class _PatientRadiologyState extends State<PatientRadiology> {
  @override
  void initState() {
    super.initState();
    PatientViewCubit.get(context).fetchRadiology(patientId: widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Radiology',
          style: getBoldStyle(color: ColorManger.primary, fontSize: 18.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<PatientViewCubit, PatientViewState>(
              builder: (context, state) {
                if (state is GetPatientRadiologyLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is GetPatientRadiologySuccsses) {
                  List<String>? images = state.radiology;
                  return Column(
                    children: [
                      verticalSpace(10),
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: images.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 210,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 100,
                              child: FullScreenWidget(
                                disposeLevel: DisposeLevel.High,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: CachedNetworkImage(
                                      placeholder: (context, url) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      imageUrl: state.radiology[index]),
                                ),
                              ),
                            );
                          }),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
