import 'package:flutter/material.dart';
import 'package:nuestra_boda/presentation/widgets/fullscreen_background.dart';
import 'package:nuestra_boda/presentation/widgets/parrafo_invitation.dart';
import '../../../core/constans/assets.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/FadeInUpAnimation.dart';
import '../../../core/utils/FlowerAnimation.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/flower_decoration2.dart';
import '../../widgets/gradient_box.dart';
import '../../widgets/invitation_text.dart';

class DesktopSection2 extends StatelessWidget {
  const DesktopSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset(
            alignment: Alignment.topCenter,
            AppAssets.imagenS2D,
            fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
          ),
        ),
        const GradientBox(height: 400),
        //const FlowerDecoration2(leftWidth: 350, rightWidth: 350),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlowerAnimation(
              imagePath: AppAssets.flowersLeft2New,
              width: 350,
              offset: Offset(-20, 0), // Mantiene el desplazamiento original
              isLeftFlower: true, // Flor izquierda
            ),
            FlowerAnimation(
              imagePath: AppAssets.flowersRight2New,
              width: 350,
              offset: Offset(20, 20), // Mantiene el desplazamiento original
              isLeftFlower: false, // Flor derecha
            ),
          ],
        ),
        FadeInUpAnimation(
          child: Text('Estamos muy emocionados de dar este gran paso y\nfelices de compartirlo contigo.\nEn esta página encontrarás todos los detalles de\nnuestro día especial.',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              fontFamily: 'AlexBrush',
              fontSize: 30,
              color: textColor,
            ),
          ),
        ),*/
        //const ParrafoInvitation(titleSize: 20, nameSize: 30, desktop: true,),
      ],
    );
  }
}
