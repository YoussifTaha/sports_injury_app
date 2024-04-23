import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_injury_app/features/injury_details/data/models/details_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/styles_manager.dart';

class InjuryMechanism extends StatefulWidget {
  final DetailsModel mechanismModel;
  const InjuryMechanism({
    super.key,
    required this.mechanismModel,
  });

  @override
  State<InjuryMechanism> createState() => _InjuryMechanismState();
}

class _InjuryMechanismState extends State<InjuryMechanism>
    with TickerProviderStateMixin {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              trimWhitespaces: true, widget.mechanismModel.videoUrl ?? '') ??
          '',
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
        widget.mechanismModel.name == null || widget.mechanismModel.name == ''
            ? SizedBox.shrink()
            : Text(
                widget.mechanismModel.name ?? '',
                style: getSemiBoldStyle(
                    color: Colors.black, fontSize: 16.sp, textHeight: 1.2),
              ),
        verticalSpace(5),
        Text(
          widget.mechanismModel.description ?? '',
          style: getRegularStyle(
              color: Colors.black, fontSize: 14.sp, textHeight: 1.2),
        ),
        verticalSpace(20),
        widget.mechanismModel.videoUrl == '' ||
                widget.mechanismModel.videoUrl == null
            ? SizedBox.shrink()
            : ClipRRect(
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
