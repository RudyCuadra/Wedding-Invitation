import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nuestra_boda/presentation/widgets/fullscreen_background.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constans/assets.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/FadeInUpAnimation.dart';
import '../../../core/utils/FlowerAnimation.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/flower_decoration2.dart';
import '../../widgets/invitation_text.dart';

class DesktopSection8 extends StatelessWidget {
  const DesktopSection8({super.key});


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        return Stack(
          alignment: Alignment.center,
          children: [
          SizedBox.expand(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Contenido con Padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Margen lateral adaptable
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02), // Espaciado adaptable
                    Image.asset(
                      AppAssets.iconoTeEsperamos,
                      width: screenWidth * 0.2, // Escala según el ancho
                      height: screenWidth * 0.2,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "''Por encima de todo, vistanse de amor,\nque es el vínculo perfecto''\n1 Colosenses 3:14",
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            fontSize: 30, // Escala en base al ancho
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
                    SizedBox(height: screenHeight * 0.05),
                    Text(
                      "Rudy &\nGeorgelis",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 80, // Escala el texto según el ancho
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[700],
                        height: 0.9,
                        fontFamily: 'AlexBrush',
                      ),
                    ),
                  ],
                ),
              ),

              /*Stack(
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
                ),*/
            ],
          ),
          ),


            Positioned(
              bottom:-10, left: 0, right: 0,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  FlowerAnimation(
                    imagePath: AppAssets.flowersLeft2New,
                    width: 250,
                    height: 280,
                    offset: Offset(-10, 0), // Mantiene el desplazamiento original
                    isLeftFlower: true, // Flor izquierda
                  ),


                  FlowerAnimation(
                    imagePath: AppAssets.flowersRight2New,
                    width: 250,
                    height: 280,
                    offset: Offset(10,20), // Mantiene el desplazamiento original
                    isLeftFlower: false, // Flor izquierda
                  ),
                ],
              ),
            ),

          ],
        );




      },
    );

  }
}
