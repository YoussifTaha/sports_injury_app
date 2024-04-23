import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/possible_injuries/logic/cubit/possible_injuries_cubit.dart';
import 'package:sports_injury_app/features/possible_injuries/ui/widgets/possible_injuries_list_bloc_builder%20copy.dart';

class Anatomyscreen extends StatefulWidget {
  final String injuryRegion;
  const Anatomyscreen({Key? key, required this.injuryRegion}) : super(key: key);

  @override
  State<Anatomyscreen> createState() => _AnatomyscreenState();
}

class _AnatomyscreenState extends State<Anatomyscreen> {
  @override
  void initState() {
    PossibleInjuriesCubit.get(context)
        .fetchRegionAnatomy(regionName: widget.injuryRegion);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${widget.injuryRegion}',
                  style: getBoldStyle(
                      color: ColorManger.darkPrimary, fontSize: 22.sp),
                ),
                verticalSpace(10),
                Text(
                  'The detailed anatomy of the region is shown below.',
                  style: getRegularStyle(
                      color: ColorManger.regularGrey.withOpacity(0.8),
                      fontSize: 14.sp,
                      textHeight: 1.1),
                ),
                verticalSpace(30),
                AnatomyListBlocBuilder(
                  regionName: widget.injuryRegion,
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ));
  }
}
