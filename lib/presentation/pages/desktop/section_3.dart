import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/FadeInUpAnimation.dart';
import '../../widgets/flower_decoration2.dart';
import '../../widgets/flower_decoration3.dart';
import '../../widgets/gradient_box.dart';

class DesktopSection3 extends StatelessWidget {
  const DesktopSection3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Fondo blanco
        Container(width: double.infinity, color: Colors.white,),
        // Contenido principal
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Con la bendición de Dios y de nuestros padres:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B7123), // Color dorado
                  fontFamily: 'InriaSerif',
                ),
              ),
              const SizedBox(height: 20),

              FadeInUpAnimation(
                child: Text(
                  'Luisa Blandon y Nicolas Rivera\nLuisa Duarte',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),

              const SizedBox(height: 40),
              const Text(
                'Nuestros Testigos:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B7123), // Color dorado
                  fontFamily: 'InriaSerif',
                ),
              ),
              const SizedBox(height: 20),

              FadeInUpAnimation(
                child: Text(
                  'Rafael Rivera y Tamara Sanchez',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(bottom:-10, left: 0, right: 0, child: FlowerDecoration3(leftWidth: screenWidth * 0.18, rightWidth: screenWidth * 0.18),),
            Padding(
              padding: const EdgeInsets.only(top: 300), // Mueve hacia abajo 50 píxeles
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/senor_fredericsen.png',
                    width: screenWidth * 0.4, // Proporción de tamaño en Desktop
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}