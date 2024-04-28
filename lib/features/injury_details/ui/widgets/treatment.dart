import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class Treatment extends StatefulWidget {
  final DetailsModel treatmentModel;
  const Treatment({
    super.key,
    required this.treatmentModel,
  });

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> with TickerProviderStateMixin {
  late YoutubePlayerController youtubePlayerController;
  late List<dynamic>? goals;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              trimWhitespaces: true, widget.treatmentModel.videoUrl ?? '') ??
          '',
      flags: YoutubePlayerFlags(
        startAt: 20,
        autoPlay: false,
        mute: true,
        loop: true,
      ),
    );
    goals = widget.treatmentModel.goals;
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.treatmentModel.name == null || widget.treatmentModel.name == ''
            ? SizedBox.shrink()
            : Text(
                widget.treatmentModel.name ?? '',
                style: getMediumStyle(
                    color: Colors.black, fontSize: 18.sp, textHeight: 1.1.sp),
              ),
        verticalSpace(5),
        widget.treatmentModel.description == null ||
                widget.treatmentModel.description == ''
            ? SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.treatmentModel.description ?? '',
                    style: getRegularStyle(
                        color: ColorManger.regularGrey,
                        fontSize: 15.sp,
                        textHeight: 1.2.sp),
                  ),
                  verticalSpace(5),
                ],
              ),
        goals == [] || goals == null
            ? SizedBox.shrink()
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(
                    goals?[index],
                    style: getThinStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 14.sp,
                        textHeight: 1.2),
                  );
                },
                itemCount: goals?.length),
        verticalSpace(10),
        widget.treatmentModel.videoUrl == '' ||
                widget.treatmentModel.videoUrl == null
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
                                    builder: (context) => Scaffold(
                                      body: SafeArea(
                                        child: YoutubePlayerBuilder(
                                            player: YoutubePlayer(
                                              controller:
                                                  youtubePlayerController,
                                              showVideoProgressIndicator: true,
                                            ),
                                            builder: (context, player) {
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
  }
}
