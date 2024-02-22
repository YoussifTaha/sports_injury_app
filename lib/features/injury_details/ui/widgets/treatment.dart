import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class Treatment extends StatefulWidget {
  const Treatment({
    super.key,
  });

  @override
  State<Treatment> createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> with TickerProviderStateMixin {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          trimWhitespaces: true,
          'https://youtu.be/t0xf7IXv_bY?si=Uqz7gyI1JXInZ0Ys')!,
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
          'Rehabilitation of ACL reconstruction phases should be goal-based rather than time-based. The major goals are the gain of full knee ROM, restore the muscle strength and proprioception, restore the functional stability, regain the best possible functional level (walking, running, jumping...), the risk of reinjury prevention, Return to the field.',
          style: getRegularStyle(
              color: ColorManger.regularGrey, fontSize: 14.sp, textHeight: 1.2),
        ),
        verticalSpace(20),
        Text(
          'Pre-surgical Stage',
          style: getMediumStyle(color: Colors.black, fontSize: 14.sp),
        ),
        verticalSpace(5),
        Text(
          '1. Normal gait.\n2. AROM 0 to 120 degrees of flexion.\n3. Twenty SLR with no knee extension lag \n4. Minimal effusion.\n5. Patient education on post-operative exercises and ambulation with crutches.',
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
