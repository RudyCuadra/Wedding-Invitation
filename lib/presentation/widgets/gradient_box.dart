import 'package:flutter/material.dart';

import '../../core/constans/assets.dart';
import '../../core/theme/colors.dart';
import '../../core/utils/FadeInUpAnimation.dart';
import '../../core/utils/FlowerAnimation.dart';

class GradientBox extends StatelessWidget {
  final double height;

  const GradientBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      bottom: 0, // Posicionado en la parte inferior
      left: 0,
      right: 0,
      child: Container(
        height: height, // Ajusta la altura del rectángulo
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0), // Blanco transparente en la parte superior
              Colors.white.withOpacity(0.8), // Blanco casi sólido en la transición
              Colors.white.withOpacity(1.0), // Blanco casi sólido en la transición
              Colors.white.withOpacity(1.0), // Blanco casi sólido en la transición
              Colors.white, // Blanco sólido en la parte inferior
            ],
            stops: [
              0.0, // Punto de inicio del color transparente
              0.3, // Transición a blanco casi sólido (ajustable)r
              0.5, // Transición a blanco casi sólido (ajustable)
              0.7, // Transición a blanco casi sólido (ajustable)
              1.0, // Blanco sólido al final
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlowerAnimation(
              imagePath: AppAssets.flowersLeft2New,
              width: 350,
              offset: Offset(-20, 0), // Mantiene el desplazamiento original
              isLeftFlower: true, // Flor izquierda
            ),


            FadeInUpAnimation(
              child: Text('Estamos muy emocionados de dar este gran paso y\nfelices de compartirlo contigo.\nEn esta página encontrarás todos los detalles de\nnuestro día especial.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                  fontFamily: 'AlexBrush',
                  fontSize: screenWidth * 0.02,
                  color: textColor,
                ),
              ),
            ),


            FlowerAnimation(
              imagePath: AppAssets.flowersRight2New,
              width: 350,
              offset: Offset(20, 20), // Mantiene el desplazamiento original
              isLeftFlower: false, // Flor derecha
            ),
          ],
        ),

      ),
    );
  }

}
