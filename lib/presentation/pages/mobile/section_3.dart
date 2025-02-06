import 'package:flutter/material.dart';
import '../../../core/utils/FadeInUpAnimation.dart';
import '../../widgets/flower_decoration3.dart';

class MobileSection3 extends StatelessWidget {
  const MobileSection3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Fondo blanco
        Container(width: double.infinity, color: Colors.white),
        // Contenido principal
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              const Text(
                'Con la bendición de Dios y de\n nuestros padres:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30, // Ajustado para Mobile
                  fontWeight: FontWeight.normal,
                  height: 0.8,
                  color: Color(0xFF8B7123), // Color dorado
                  fontFamily: 'AlexBrush',
                ),
              ),
              SizedBox(height: screenHeight * 0.08),

              FadeInUpAnimation(
                child: Text(
                  'Luisa Blandon y Nicolas Rivera\nLuisa Duarte',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20, // Ajustado para Mobile
                    color: Colors.black87,
                    fontFamily: 'InriaSerif',
                  ),
                ),
              ),


              SizedBox(height: screenHeight * 0.08),



              const Text(
                'Nuestros Testigos:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30, // Ajustado para Mobile
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF8B7123), // Color dorado
                  fontFamily: 'AlexBrush',
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              FadeInUpAnimation(
                child: Text(
                  'Rafael Rivera y Tamara Sanchez',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20, // Ajustado para Mobile
                    color: Colors.black87,
                    fontFamily: 'InriaSerif',
                  ),
                ),
              ),


              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
        // Decoraciones florales y dibujo de los casados en la parte inferior
        Positioned(bottom:-10, left: 0, right: 0, child: FlowerDecoration3(leftWidth: screenWidth * 0.3, rightWidth: screenWidth * 0.3),),
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/images/senor_fredericsen.png',
            width: screenWidth * 0.9, // Ajustado para Mobile
          ),
        ),
      ],
    );
  }
}
