import 'package:flutter/material.dart';
import '../../core/constans/assets.dart';
import '../../core/utils/FlowerAnimation.dart';

class FlowerDecoration3 extends StatelessWidget {
  final double leftWidth;
  final double rightWidth;

  const FlowerDecoration3({super.key, required this.leftWidth, required this.rightWidth});

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
            offset: Offset(0, 0), // Mantiene el desplazamiento original
            isLeftFlower: true,  // Flor izquierda
          ),
          FlowerAnimation(
            imagePath: AppAssets.flowersRight2New,
            width: rightWidth,
            offset: Offset(15, 10), // Mantiene el desplazamiento original
            isLeftFlower: false, // Flor derecha
          ),




          /*Image.asset(
            //AppAssets.flowersLeft3,
            AppAssets.flowersLeft2New,
            width: leftWidth,
            fit: BoxFit.cover,
          ),*/
          /*Transform.translate(
            offset: Offset(15, 10),
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
