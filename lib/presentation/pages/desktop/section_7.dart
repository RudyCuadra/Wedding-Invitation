import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nuestra_boda/presentation/widgets/fullscreen_background.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constans/assets.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/DancingAnimation.dart';
import '../../../core/utils/FadeInUpAnimation.dart';
import '../../../core/utils/FlowerAnimation.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/flower_decoration2.dart';
import '../../widgets/invitation_text.dart';

class DesktopSection7 extends StatelessWidget {
  const DesktopSection7({super.key});


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 50,),
            Text(
              "Codigo de Vestimenta",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                height: 0.8,
                fontWeight: FontWeight.w500,
                color: Colors.brown[700],
                fontFamily: 'AlexBrush',
              ),
            ),
            SizedBox(height: 30,),
            Text(
              "Elegante",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                height: 0.8,
                fontWeight: FontWeight.w500,
                color: Colors.brown[700],
                fontFamily: 'InriaSerif',
              ),
            ),
            SizedBox(height: 80,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.iconoEllos,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 30 ,),
                Image.asset(
                  AppAssets.iconoEllas,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 30 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ellos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    height: 0.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                    fontFamily: 'InriaSerif',
                  ),
                ),
                SizedBox(width: 80 ,),
                Text(
                  "Ellas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    height: 0.8,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                    fontFamily: 'InriaSerif',
                  ),
                ),
              ],
            ),

            SizedBox(height: 40,),
            FadeInUpAnimation(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "🎨 Colores Reservados: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[700],
                      fontFamily: 'InriaSerif',
                    ),
                  ),
                  Text(
                    "Blanco ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[700],
                      fontFamily: 'InriaSerif',
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.black, size: 20), // Borde negro
                      Icon(Icons.favorite, color: Colors.white, size: 16), // Corazón blanco
                    ],
                  ),
                  Text(
                    " y Azul ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown[700],
                      fontFamily: 'InriaSerif',
                    ),
                  ),
                  Icon(Icons.favorite, color: Colors.blue, size: 18), // Corazón Azul
                ],
              ),
            ),
            SizedBox(height: 40,),

            FadeInUpAnimation(
              child: Text(
                "Agradecemos de antemano la\nconfirmacion de tu asistencia.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[700],
                  fontFamily: 'InriaSerif',
                ),
              ),
            ),

            /*Text(
              "Agradecemos de antemano la\nconfirmacion de tu asistencia.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 0.8,
                fontWeight: FontWeight.w500,
                color: Colors.brown[700],
                fontFamily: 'InriaSerif',
              ),
            ),*/
            SizedBox(height: 50,),
            DancingAnimation(
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/confirmar');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorBottom, // Color de fondo
                  foregroundColor: textColorButtom, // Color del texto
                  shadowColor: Colors.black, // Color de la sombra
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  elevation: 5, // Altura de la sombra
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Espaciado interno
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), // Bordes redondeados
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person_add_alt_sharp, color: textColorButtom), // Ícono
                    SizedBox(width: 10),
                    Text("Confirmar Asistencia"),
                  ],
                ),
              ),
            ),
            /*ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/confirmar');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorBottom, // Color de fondo
                foregroundColor: textColorButtom, // Color del texto
                shadowColor: Colors.black, // Color de la sombra
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                elevation: 5, // Altura de la sombra
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Espaciado interno
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_add_alt_sharp, color: textColorButtom), // Ícono de ubicación
                  SizedBox(width: 10), // Espaciado entre el ícono y el texto
                  Text("Confirmar Asistencia"),
                ],
              ),
            ),*/
            Spacer(), // Esto empuja todo hacia arriba y deja espacio abajo
          ],
        ),
        Positioned(bottom:-10, left: 0, right: 0, child: FlowerDecoration2(leftWidth: screenWidth * 0.2, rightWidth: screenWidth * 0.2),),
      ],
    );
  }
}
