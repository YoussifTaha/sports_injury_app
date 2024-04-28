import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/patient_view/logic/cubit/patient_view_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class PatientViewTreatment extends StatefulWidget {
  final int patientId;
  const PatientViewTreatment({
    super.key,
    required this.patientId,
  });

  @override
  State<PatientViewTreatment> createState() => _PatientViewTreatmentState();
}

class _PatientViewTreatmentState extends State<PatientViewTreatment>
    with TickerProviderStateMixin {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    PatientViewCubit.get(context).fetchTreatment(patientId: widget.patientId);
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Treatment Program',
          style: getBoldStyle(color: ColorManger.primary, fontSize: 18.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<PatientViewCubit, PatientViewState>(
          builder: (context, state) {
            if (state is GetPatientBasicInfoLoadingState) {
              return Center(
                  child: CircularProgressIndicator(
                color: ColorManger.primary,
              ));
            } else if (state is GetPatientTreatmentSuccsses) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    late List<dynamic> goals =
                        state.treatment[index].goals ?? [];
                    youtubePlayerController = YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(
                              trimWhitespaces: true,
                              state.treatment[index].videoUrl ?? '') ??
                          '',
                      flags: YoutubePlayerFlags(
                        startAt: 20,
                        autoPlay: false,
                        mute: true,
                        loop: true,
                      ),
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.treatment[index].name == null ||
                                state.treatment[index].name == ''
                            ? SizedBox.shrink()
                            : Text(
                                state.treatment[index].name ?? '',
                                style: getMediumStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    textHeight: 1.1.sp),
                              ),
                        verticalSpace(5),
                        state.treatment[index].description == null ||
                                state.treatment[index].description == ''
                            ? SizedBox.shrink()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.treatment[index].description ?? '',
                                    style: getRegularStyle(
                                        color: ColorManger.regularGrey,
                                        fontSize: 15.sp,
                                        textHeight: 1.2.sp),
                                  ),
                                  verticalSpace(5),
                                ],
                              ),
                        goals == []
                            ? SizedBox.shrink()
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Text(
                                    goals[index] ?? '',
                                    style: getThinStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 14.sp,
                                        textHeight: 1.2),
                                  );
                                },
                                itemCount: goals.length),
                        verticalSpace(10),
                        state.treatment[index].videoUrl == '' ||
                                state.treatment[index].videoUrl == null
                            ? SizedBox.shrink()
                            : Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: YoutubePlayer(
                                        bottomActions: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Scaffold(
                                                      body: SafeArea(
                                                        child:
                                                            YoutubePlayerBuilder(
                                                                player:
                                                                    YoutubePlayer(
                                                                  controller:
                                                                      youtubePlayerController,
                                                                  showVideoProgressIndicator:
                                                                      true,
                                                                ),
                                                                builder:
                                                                    (context,
                                                                        player) {
                                                                  return player;
                                                                }),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.fullscreen))
                                        ],
                                        controller: youtubePlayerController,
                                        showVideoProgressIndicator: true,
                                      ),
                                    ),
                                  ),
                                  verticalSpace(10),
                                ],
                              ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return verticalSpace(20);
                  },
                  itemCount: state.treatment.length);
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
