import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../core/constans/assets.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/FlowerAnimation.dart';
import '../../core/utils/ZoomingText.dart';

class InvitationText extends StatelessWidget {
  final double titleSize;
  final double nameSize;

  const InvitationText({super.key, required this.titleSize, required this.nameSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 150),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*Transform.translate(
              offset: Offset(-20, 0), // Mueve la imagen 5 píxeles hacia la izquierda
              child: Image.asset(
                AppAssets.flowersLeftNew,
                width: 140,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),*/
            FlowerAnimation(
              imagePath: AppAssets.flowersLeftNew,
              width: 140,
              height: 130,
              offset: Offset(-20, 0), // Mantiene el desplazamiento original
              isLeftFlower: true, // Flor izquierda
            ),
            FlowerAnimation(
              imagePath: AppAssets.flowersRightNew,
              width: 140,
              height: 130,
              offset: Offset(20, 0), // Mantiene el desplazamiento original
              isLeftFlower: false, // Flor izquierda
            ),
            /*Transform.translate(
              offset: Offset(20, 0), // Mueve la imagen 5 píxeles hacia la derecha
              child: Image.asset(
                AppAssets.flowersRightNew,
                width: 140,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),*/
          ],
        ),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              "ESTÁS INVITADO A\nNUESTRA BODA",
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontFamily: 'InriaSerif',
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              speed: Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 1, // Para que la animación solo se ejecute una vez
          isRepeatingAnimation: false, // Evita que la animación se repita
        ),
        /*Text(
          'ESTÁS INVITADO A\nNUESTRA BODA',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),*/
        const SizedBox(height: 10),
        ZoomingText(
          text: 'Rudy & Georgelis',
          textStyle: TextStyle(
            fontFamily: 'AlexBrush',
            fontSize: nameSize,
            color: textColor,
          ),
        ),
        /*Text(
          'Rudy & Georgelis',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'AlexBrush',
            fontSize: nameSize,
            color: textColor,
          ),
        ),*/
        const SizedBox(height: 20),
      ],
    );
  }
}
