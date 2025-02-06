import 'package:flutter/material.dart';
import 'package:nuestra_boda/core/theme/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../core/constans/assets.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/fullscreen_background.dart';
import '../../widgets/invitation_text.dart';

class MobileSection1 extends StatelessWidget {
  const MobileSection1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: backgroundColor, height: double.infinity, width: double.infinity,),
        const FullscreenBackground(imagePath: AppAssets.imagenS1),
        BackgroundImage(imagePath: AppAssets.bottomImage, width: MediaQuery.of(context).size.width, height: 300, ),
        InvitationText(titleSize: 30, nameSize: 55),
      ],
    );
  }
}
