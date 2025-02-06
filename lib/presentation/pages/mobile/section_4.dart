import 'package:flutter/material.dart';
import 'package:nuestra_boda/core/theme/colors.dart';

import '../../../core/constans/assets.dart';
import '../../../core/utils/FadeInUpAnimation.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/fullscreen_background.dart';
import '../../widgets/invitation_text.dart';

class MobileSection4 extends StatelessWidget {
  const MobileSection4({super.key});

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
            Transform.translate(
              offset: Offset(0, -150),
              child: Image.asset(
                AppAssets.imagenS3,
                fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -100, // Desplazar la imagen hacia abajo
          child:
          Image.asset(
            AppAssets.backgroundSectionFour,
            width: MediaQuery.of(context).size.width,
            height: 580,
            fit: BoxFit.cover,
          ),
        ),


        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.floresSectionFour,
              width: 260,  // Ancho deseado
              height: 109, // Alto deseado
              fit: BoxFit.cover, // Ajusta la imagen dentro del tamaño dado
            ),
            SizedBox(height: 20),
            // MENSAJE INVITACION

            FadeInUpAnimation(
              child: Text(
                "Nos gustaría que nos acompañes\nmientras celebramos nuestra unión\ny el inicio de una nueva vida juntos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown[700],
                  fontFamily: 'InriaSerif',
                ),
              ),
            ),
            Image.asset(
              AppAssets.floresdosSectionFour,
              fit: BoxFit.cover, // Ajusta la imagen dentro del tamaño dado
            ),
            //SizedBox(height: 16),
            //FECHA
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InfoColumn(title: "SÁBADO"),
                //InfoColumn(title: "ABRIL"),
                Column(
                  children: [
                    Text(
                      "ABRIL",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[700],
                        fontFamily: 'InriaSerif',
                      ),
                    ),
                    Text(
                      "05",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                        fontFamily: 'InriaSerif',
                      ),
                    ),
                    Text(
                      "2025",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown[700],
                        fontFamily: 'InriaSerif',
                      ),
                    ),
                  ],
                ),
                InfoColumn(title: "5:30 PM"),
              ],
            ),
            //SizedBox(height: 30),
          ],
        ),
      ],
    );


  }
}


// Widget reutilizable para la información de la fecha y hora
class InfoColumn extends StatelessWidget {
  final String title;
  const InfoColumn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120, // Ajusta el ancho del Divider según lo necesites
          child: Divider(
            color: Colors.brown[300],
            thickness: 2,
            height: 8,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
            fontFamily: 'InriaSerif',
          ),
        ),
        SizedBox(height: 4), // Espacio entre el texto y el Divider
        SizedBox(
          width: 120, // Ajusta el ancho del Divider según lo necesites
          child: Divider(
            color: Colors.brown[300],
            thickness: 2,
            height: 8,
          ),
        ),
      ],
    );
  }
}
