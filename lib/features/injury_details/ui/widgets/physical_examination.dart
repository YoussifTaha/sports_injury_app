import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class InjuryPhysicalExamination extends StatefulWidget {
  final DetailsModel physicalExaminationModel;
  const InjuryPhysicalExamination({
    super.key,
    required this.physicalExaminationModel,
  });

  @override
  State<InjuryPhysicalExamination> createState() =>
      _InjuryPhysicalExaminationState();
}

class _InjuryPhysicalExaminationState extends State<InjuryPhysicalExamination>
    with TickerProviderStateMixin {
  late List<dynamic>? goals;

  @override
  void initState() {
    super.initState();
    goals = widget.physicalExaminationModel.goals;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.physicalExaminationModel.goals == null
            ? SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.physicalExaminationModel.goals?.first ?? '',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 18.sp),
                  ),
                  verticalSpace(10),
                ],
              ),
        widget.physicalExaminationModel.name == null ||
                widget.physicalExaminationModel.name == ''
            ? SizedBox.shrink()
            : Column(
                children: [
                  Text(
                    widget.physicalExaminationModel.name ?? '',
                    style: getMediumStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                  verticalSpace(5),
                ],
              ),
        Text(
          widget.physicalExaminationModel.description ?? '',
          style: getRegularStyle(
              color: ColorManger.regularGrey, fontSize: 14.sp, textHeight: 1.2),
        ),
        verticalSpace(5),
        widget.physicalExaminationModel.goals == null
            ? SizedBox.shrink()
            : ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(
                    goals?[index],
                    style: getRegularStyle(
                        color: ColorManger.regularGrey,
                        fontSize: 14.sp,
                        textHeight: 1.2),
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSpace(5);
                },
                itemCount: goals?.length ?? 0,
              ),
      ],
    );
  }
}
