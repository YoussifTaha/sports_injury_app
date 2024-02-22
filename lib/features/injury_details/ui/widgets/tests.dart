import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/Helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles_manager.dart';

class InjuryTests extends StatefulWidget {
  const InjuryTests({
    super.key,
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
          trimWhitespaces: true,
          'https://youtu.be/JFkbKNNa7xQ?si=-w_CsgBmMyl0pKpP')!,
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
          '1- Lachman Test',
          style: getMediumStyle(color: Colors.black, fontSize: 14.sp),
        ),
        verticalSpace(5),
        Text(
          'the patient lies on their back with the knee bent at a slight angle, and the examiner stabilizes the thigh while applying a forward force to the lower leg. Increased anterior translation compared to the uninjured knee suggests potential ACL laxity',
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
