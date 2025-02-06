import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nuestra_boda/core/constans/assets.dart';

import '../../../core/utils/FlowerAnimation.dart';

class MobileSection8 extends StatelessWidget {
  const MobileSection8({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth1 = MediaQuery.of(context).size.width;
    final screenHeight1 = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        return SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Contenido con Padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Margen lateral adaptable
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.05), // Espaciado adaptable
                    Image.asset(
                      AppAssets.iconoTeEsperamos,
                      width: screenWidth * 0.6, // Escala según el ancho
                      height: screenWidth * 0.6,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "''Por encima de todo, vistanse de amor,\nque es el vínculo perfecto''\n1 Colosenses 3:14",
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.04, // Escala en base al ancho
                            fontWeight: FontWeight.w500,
                            color: Colors.brown[700],
                            fontFamily: 'InriaSerif',
                          ),
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1, // Para que la animación solo se ejecute una vez
                      isRepeatingAnimation: false, // Evita que la animación se repita
                    ),


                    /*Text(
                      "Por encima de todo, vistanse de amor,\nque es el vínculo perfecto\n1 Colosenses 3:14",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Escala en base al ancho
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[700],
                        fontFamily: 'InriaSerif',
                      ),
                    ),*/
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      "Rudy &\nGeorgelis",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.15, // Escala el texto según el ancho
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[700],
                        height: 0.9,
                        fontFamily: 'AlexBrush',
                      ),
                    ),
                  ],
                ),
              ),

              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        FlowerAnimation(
                          imagePath: AppAssets.flowersLeft2New,
                          width: 150,
                          height: 180,
                          offset: Offset(-10, 0), // Mantiene el desplazamiento original
                          isLeftFlower: true, // Flor izquierda
                        ),


                        FlowerAnimation(
                          imagePath: AppAssets.flowersRight2New,
                          width: 150,
                          height: 180,
                          offset: Offset(10,20), // Mantiene el desplazamiento original
                          isLeftFlower: false, // Flor izquierda
                        ),
                      ],
                    ),
                  //),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
