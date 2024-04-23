import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:sports_injury_app/features/add_patient/data/models/add_user_info_model.dart';
import 'package:sports_injury_app/features/add_patient/logic/cubit/add_patient_cubit.dart';
import 'package:sports_injury_app/features/add_patient/ui/widgets/add_photo_button.dart';
import 'package:sports_injury_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/add_patient/ui/widgets/injury_region_choice.dart';
import 'package:sports_injury_app/features/add_patient/ui/widgets/radiology_images.dart';

class AddBasicInfoPage extends StatelessWidget {
  final TextEditingController iDController;
  final PageController pageController;
  const AddBasicInfoPage(
      {Key? key, required this.pageController, required this.iDController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController chiefComplainController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    TextEditingController injuryDateController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController positionController = TextEditingController();

    // String capitalizeEachWord(String input) {
    //   List<String> words = input.split(' ');
    //   words = words.map((word) {
    //     if (word.isNotEmpty) {
    //       return word[0].toUpperCase() + word.substring(1).toLowerCase();
    //     } else {
    //       return word;
    //     }
    //   }).toList();
    //   return words.join(' ');
    // }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic info:',
                  style: getSemiBoldStyle(color: Colors.black, fontSize: 18.sp),
                ),
                verticalSpace(30),
                Text(
                  'Full Name',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: fullNameController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(10),
                Text(
                  'Chief Complain',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: chiefComplainController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(10),
                Text(
                  'Injury Date',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: injuryDateController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(10),
                Text(
                  'Age',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: ageController,
                    type: TextInputType.number,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(10),
                Text(
                  'Gender',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: genderController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(10),
                Text(
                  'Position',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                InfoInputField(
                    controller: positionController,
                    type: TextInputType.text,
                    validationMessage: 'This Field Cannot Be Empty'),
                verticalSpace(20),
                InjuryRegionChoice(),
                Text(
                  'Add Patient Radiology',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 14.sp),
                ),
                verticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          AddPhotoButton(
                            text: 'Take Photo',
                            function: () {
                              AddPatientCubit.get(context)
                                  .pickImageFromCamera();
                            },
                            icon: Icons.camera_alt,
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(5),
                    Expanded(
                      child: Column(
                        children: [
                          AddPhotoButton(
                            text: 'Add Photos',
                            function: () {
                              AddPatientCubit.get(context)
                                  .pickImageFromGallery();
                            },
                            icon: Icons.photo_library,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                RadiologyImages(),
                verticalSpace(30),
                Text(
                  'You can add the exsisting treatment program introduced by our app to the patient profile below.The program will be based on the suspected injury.',
                  style: getRegularStyle(
                          color: Colors.black, fontSize: 12.sp, textHeight: 1.2)
                      .copyWith(letterSpacing: 0.5.sp),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(20),
                BlocConsumer<AddPatientCubit, AddPatientState>(
                  listener: (context, state) {
                    if (state is AddPatientSuccsses) {
                      context.pushNamed(
                        Routes.homeScreen,
                      );
                    }
                    if (state is AddPatientError) {
                      showToast(text: state.error, state: ToastStates.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is AddPatientLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else
                      return button(
                        context: context,
                        function: () {
                          String? injuryRegion =
                              AddPatientCubit.get(context).injuryRegion;
                          String? suspectedInjury =
                              AddPatientCubit.get(context).suspectedInjury;

                          UserInfoModel patientInfo = UserInfoModel(
                              chiefComplain: chiefComplainController.text,
                              sessionDate: injuryDateController.text,
                              age: ageController.text,
                              gender: genderController.text,
                              position: positionController.text,
                              injuryRegion: injuryRegion ?? '',
                              suspectedInjury: suspectedInjury ?? '');
                          if (formKey.currentState!.validate()) {
                            if (injuryRegion == null ||
                                suspectedInjury == null) {
                              showToast(
                                  text:
                                      'Please choose injury region and suspected injury',
                                  state: ToastStates.error);
                            } else {
                              AddPatientCubit.get(context)
                                  .addAllTreatmentProgramToUserExercises(
                                      patientId: int.parse(iDController.text));
                              AddPatientCubit.get(context)
                                  .uploadRadiologyImages(
                                patientId: int.parse(iDController.text),
                              );
                              AddPatientCubit.get(context).fetchPatientUser(
                                  patientId: int.parse(iDController.text),
                                  patientInfo: patientInfo);
                            }
                          }
                        },
                        text: 'Add Treatment Program & Continue',
                      );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
