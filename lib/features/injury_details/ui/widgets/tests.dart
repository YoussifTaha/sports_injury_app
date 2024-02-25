import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class InjuryTests extends StatefulWidget {
  final DetailsModel testsModel;
  const InjuryTests({
    super.key,
    required this.testsModel,
  });

  @override
  State<InjuryTests> createState() => _InjuryTestsState();
}

class _InjuryTestsState extends State<InjuryTests>
    with TickerProviderStateMixin {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          trimWhitespaces: true, widget.testsModel.videoUrl ?? '')!,
      flags: YoutubePlayerFlags(
        startAt: 20,
        autoPlay: false,
        mute: true,
        loop: true,
      ),
    );
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
        Text(
          widget.testsModel.name ?? '',
          style: getMediumStyle(color: Colors.black, fontSize: 14.sp),
        ),
        verticalSpace(5),
        Text(
          widget.testsModel.description ?? '',
          style: getRegularStyle(
              color: ColorManger.regularGrey, fontSize: 14.sp, textHeight: 1.2),
        ),
        verticalSpace(10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
          ),
        ),
      ],
    );
  }
}
