import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/possible_injuries/logic/cubit/possible_injuries_cubit.dart';
import 'package:sports_injury_app/features/possible_injuries/ui/widgets/possible_injuries_list_bloc_builder.dart';

class PossibleInjuriescreen extends StatefulWidget {
  final String injuryRegion;
  const PossibleInjuriescreen({Key? key, required this.injuryRegion})
      : super(key: key);

  @override
  State<PossibleInjuriescreen> createState() => _PossibleInjuriescreenState();
}

class _PossibleInjuriescreenState extends State<PossibleInjuriescreen> {
  @override
  void initState() {
    PossibleInjuriesCubit.get(context)
        .fetchInjuriesToTheRegion(regionName: widget.injuryRegion);
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
                  'Possible Injuries to the ${widget.injuryRegion}',
                  style: getBoldStyle(
                      color: ColorManger.darkPrimary, fontSize: 22.sp),
                ),
                verticalSpace(10),
                Text(
                  'Each one of these injuries have information that include possible injury mechanisms to the ${widget.injuryRegion} and the tests to confirm them and the exercises program to recover from it.',
                  style: getRegularStyle(
                      color: ColorManger.regularGrey.withOpacity(0.8),
                      fontSize: 14.sp,
                      textHeight: 1.1),
                ),
                verticalSpace(30),
                PossibleInjuriesListBlocBuilder(
                  regionName: widget.injuryRegion,
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ));
  }
}
