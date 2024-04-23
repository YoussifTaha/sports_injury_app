import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/add_patient/logic/cubit/add_patient_cubit.dart';

class RadiologyImages extends StatelessWidget {
  const RadiologyImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPatientCubit, AddPatientState>(
      builder: (context, state) {
        List<XFile?>? images = AddPatientCubit.get(context).images;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            images!.isEmpty
                ? SizedBox.shrink()
                : Text(
                    'Chosen Radilogy Images :',
                    style: getMediumStyle(
                        color: ColorManger.primary, fontSize: 14.sp),
                  ),
            verticalSpace(10),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: images.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 210,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  File imageFile = File(images[index]!.path);
                  return SizedBox(
                    height: 100,
                    child: Stack(
                      children: [
                        Image.file(imageFile),
                        IconButton(
                          onPressed: () {
                            AddPatientCubit.get(context)
                                .removeImage(image: images[index]);
                          },
                          icon: Icon(Icons.remove_circle_sharp),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
