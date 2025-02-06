import 'package:flutter/material.dart';
import 'package:nuestra_boda/core/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constans/assets.dart';
import '../../../core/utils/FadeInUpAnimation.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/flower_decoration2.dart';
import '../../widgets/fullscreen_background.dart';
import '../../widgets/invitation_text.dart';

class MobileSection6 extends StatelessWidget {
  const MobileSection6({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 50,),
            Text(
              "Opciones de regalo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                height: 0.8,
                fontWeight: FontWeight.w500,
                color: Colors.brown[700],
                fontFamily: 'AlexBrush',
              ),
            ),
            SizedBox(height: 12,),
            SizedBox(
              width: 300, // Ajusta el ancho del Divider según lo necesites
              child: Divider(
                color: Colors.brown[300],
                thickness: 2,
                height: 8,
              ),
            ),
            SizedBox(height: 80,),
            Image.asset(
              AppAssets.iconoSobre,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50,),
            FadeInUpAnimation(
              child: Text(
                "Tu presencia es el regalo mas valioso para\nnosotros en este dia tan especial. Si deseas\nacompanarnos con un detalle adicional, tu\ncarino en forma de un sobre lo apresiariamos\nprofundamente.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  //height: 0.8,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[700],
                  fontFamily: 'InriaSerif',
                ),
              ),
            ),
            /*Text(
              "Tu presencia es el regalo mas valioso para\nnosotros en este dia tan especial. Si deseas\nacompanarnos con un detalle adicional, tu\ncarino en forma de un sobre lo apresiariamos\nprofundamente.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                //height: 0.8,
                fontWeight: FontWeight.w500,
                color: Colors.brown[700],
                fontFamily: 'InriaSerif',
              ),
            ),*/
            SizedBox(height: 50,),
            Text(
              "Lluvia de Sobres",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 0.8,
                fontWeight: FontWeight.bold,
                color: Colors.brown[700],
                fontFamily: 'InriaSerif',
              ),
            ),
            Spacer(), // Esto empuja todo hacia arriba y deja espacio abajo
          ],
        ),
        Positioned(bottom:-10, left: 0, right: 0, child: FlowerDecoration2(leftWidth: screenWidth * 0.4, rightWidth: screenWidth * 0.4),),
      ],
    );


  }
}
