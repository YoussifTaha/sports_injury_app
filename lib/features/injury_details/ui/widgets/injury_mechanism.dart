import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/styles_manager.dart';

class InjuryMechanism extends StatefulWidget {
  const InjuryMechanism({
    super.key,
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
          trimWhitespaces: true,
          'https://www.youtube.com/watch?v=7LtDc1ExinM')!,
      flags: YoutubePlayerFlags(
        startAt: 15,
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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
        showVideoProgressIndicator: true,
      ),
      builder: (p0, p1) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1 : Landing Incorrectly from a Jump: Awkward landings, particularly when landing with the knee in a slightly bent or hyperextended position, can put excessive stress on the ACL.',
              style: getRegularStyle(
                  color: Colors.black, fontSize: 14.sp, textHeight: 1.2),
            ),
            verticalSpace(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Colors.black,
                          child: YoutubePlayer(
                            controller: youtubePlayerController,
                            showVideoProgressIndicator: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}