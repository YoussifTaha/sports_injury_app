import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/core/Helpers/spacing.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/theming/styles_manager.dart';
import 'package:sports_injury_app/features/possible_injuries/logic/cubit/possible_injuries_cubit.dart';

class AnatomyListBlocBuilder extends StatelessWidget {
  final String regionName;
  const AnatomyListBlocBuilder({super.key, required this.regionName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PossibleInjuriesCubit, PossibleInjuriesState>(
        builder: (context, state) {
      if (state is PossibleInjuriesLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is FetchAnatomySuccsses) {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.anatomy[index].name ?? '',
                          style: getBoldStyle(
                              color: ColorManger.darkPrimary, fontSize: 22.sp),
                        ),
                        verticalSpace(40),
                        SizedBox(
                          width: double.infinity,
                          height: 150.h,
                          child: CachedNetworkImage(
                              placeholder: (context, url) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              imageUrl: state.anatomy[index].image ?? ''),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: state.anatomy.length,
          separatorBuilder: (context, index) => verticalSpace(10),
        );
      } else if (state is PossibleInjuriesError) {
        return Text(state.error);
      } else
        return Text('Unknown Error');
    });
  }
}
