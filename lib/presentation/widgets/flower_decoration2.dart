import 'package:flutter/material.dart';
import '../../core/constans/assets.dart';
import '../../core/utils/FlowerAnimation.dart';

class FlowerDecoration2 extends StatelessWidget {
  final double leftWidth;
  final double rightWidth;

  const FlowerDecoration2({super.key, required this.leftWidth, required this.rightWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 400), // Mueve hacia abajo 50 píxeles
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlowerAnimation(
            imagePath: AppAssets.flowersLeft2New,
            width: leftWidth,
            offset: Offset(-20, 0), // Mantiene el desplazamiento original
            isLeftFlower: true, // Flor izquierda
          ),
          FlowerAnimation(
            imagePath: AppAssets.flowersRight2New,
            width: rightWidth,
            offset: Offset(20, 20), // Mantiene el desplazamiento original
            isLeftFlower: false, // Flor derecha
          ),
        /*Transform.translate(
          offset: Offset(-20, 0), // Mueve la imagen 5 píxeles hacia la izquierda
          child: Image.asset(
              AppAssets.flowersLeft2New,
              width: leftWidth,
              fit: BoxFit.cover,
            ),
          ),
          Transform.translate(
            offset: Offset(20, 20),
            child: Image.asset(
              AppAssets.flowersRight2New,
              width: rightWidth,
              fit: BoxFit.cover,
            ),
          ),*/
        ],
      ),
    );
  }
}
