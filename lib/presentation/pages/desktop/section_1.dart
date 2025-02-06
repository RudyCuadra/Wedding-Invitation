import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nuestra_boda/presentation/widgets/fullscreen_background.dart';
import '../../../core/constans/assets.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/FlowerAnimation.dart';
import '../../../core/utils/ZoomingText.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/invitation_text.dart';

class DesktopSection1 extends StatelessWidget {
  const DesktopSection1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [

        Positioned.fill(
          child: Image.asset(
            AppAssets.imagenS1D,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),

        Positioned(
          bottom: -screenHeight * 0.15, // 15% de la altura
          child: Image.asset(
            AppAssets.bottomImage,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlowerAnimation(
                  imagePath: AppAssets.flowersLeftNew,
                  width: screenWidth * 0.15, // 15% del ancho de la pantalla
                  height: screenHeight * 0.28, // 28% de la altura de la pantalla
                  offset: Offset(-20, 0), // Mantiene el desplazamiento original
                  isLeftFlower: true, // Flor izquierda
                ),
                FlowerAnimation(
                  imagePath: AppAssets.flowersRightNew,
                  width: screenWidth * 0.15, // 15% del ancho de la pantalla
                  height: screenHeight * 0.28, // 28% de la altura de la pantalla
                  offset: Offset(20, 0), // Mantiene el desplazamiento original
                  isLeftFlower: false, // Flor izquierda
                ),
              ],
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "ESTÁS INVITADO A\nNUESTRA BODA",
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontFamily: 'InriaSerif',
                    fontSize: screenWidth * 0.02,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  speed: Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1, // Para que la animación solo se ejecute una vez
              isRepeatingAnimation: false, // Evita que la animación se repita
            ),

            const SizedBox(height: 10),
            ZoomingText(
              text: 'Rudy & Georgelis',
              textStyle: TextStyle(
                fontFamily: 'AlexBrush',
                fontSize: 55,
                color: textColor,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}
