import 'package:flutter/material.dart';
import 'package:nuestra_boda/core/theme/colors.dart';

import '../../../core/constans/assets.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/flower_decoration2.dart';
import '../../widgets/fullscreen_background.dart';
import '../../widgets/gradient_box.dart';
import '../../widgets/invitation_text.dart';
import '../../widgets/parrafo_invitation.dart';

class MobileSection2 extends StatelessWidget {
  const MobileSection2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: backgroundColor, height: double.infinity, width: double.infinity,),
        //const FullscreenBackground(imagePath: AppAssets.background),
        Positioned.fill(
          bottom: 250,
          child: Image.asset(
          AppAssets.imagenS2,
          fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
          ),
        ),
        Positioned(
          bottom: 0, // Pegado a la parte inferior
          left: 0,
          right: 0,
          child: Container(
            height: screenHeight * 0.50, // Se limita al 25% de la altura en lugar de expandirse
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.0), // Transparente en la parte superior
                  //Colors.white.withOpacity(0.3), // Un poco más visible
                  Colors.white, // Un poco más visible
                  Colors.white, // Transición media
                  Colors.white, // Casi sólido
                  Colors.white, // Blanco sólido al final
                ],
                stops: [
                  0.0,  // Inicio transparente
                  0.2,  // Transición compacta
                  0.4,  // Punto medio más visible
                  0.7,  // Casi sólido
                  1,  // Blanco sólido
                ],
              ),
            ),
          ),
        ),
        //----------------------------------------------------
        Positioned(bottom:-10, left: 0, right: 0, child: FlowerDecoration2(leftWidth: screenWidth * 0.4, rightWidth: screenWidth * 0.4),),
        ParrafoInvitation(titleSize: 100, nameSize: 28, desktop: false,),
      ],
    );
  }
}
