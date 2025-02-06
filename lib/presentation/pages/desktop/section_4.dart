import 'package:flutter/material.dart';
import 'package:nuestra_boda/presentation/widgets/fullscreen_background.dart';
import '../../../core/constans/assets.dart';
import '../../../core/utils/FadeInUpAnimation.dart';
import '../../../core/utils/FlowerAnimation.dart';
import '../../widgets/background_image.dart';
import '../../widgets/flower_decoration.dart';
import '../../widgets/invitation_text.dart';

class DesktopSection4 extends StatelessWidget {
  const DesktopSection4({super.key});


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset(
            AppAssets.imagenS3D,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),

        Positioned(
          bottom: -screenHeight * 0.15, // 15% de la altura
          child: Image.asset(
            AppAssets.backgroundSectionFour,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
        ),

        /*Positioned(
          bottom: -100, // Desplazar la imagen hacia abajo
          child:
          Image.asset(
            AppAssets.backgroundSectionFour,
            width: MediaQuery.of(context).size.width,
            height: 580,
            fit: BoxFit.cover,
          ),
        ),*/

        Positioned(
          bottom: 0, // Posicionado en la parte inferior
          left: 0,
          right: 0,
          child: Row(
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
        ),


        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /*Image.asset(
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
            ),*/

            Image.asset(
              AppAssets.floresSectionFour,
              width: 260,  // Ancho deseado
              height: 109, // Alto deseado
              fit: BoxFit.cover, // Ajusta la imagen dentro del tamaño dado
            ),

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


            //FECHA
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*FlowerAnimation(
                  imagePath: AppAssets.flowersLeft2New,
                  width: 200,
                  offset: Offset(-20, 0), // Mantiene el desplazamiento original
                  isLeftFlower: true, // Flor izquierda
                ),*/


                InfoColumn(title: "SÁBADO"),
                //InfoColumn(title: "ABRIL"),
                SizedBox(width: 50,),
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
                SizedBox(width: 50,),
                InfoColumn(title: "5:30 PM"),


                /*FlowerAnimation(
                  imagePath: AppAssets.flowersRight2New,
                  width: 200,
                  offset: Offset(20, 20), // Mantiene el desplazamiento original
                  isLeftFlower: false, // Flor derecha
                ),*/
              ],
            ),
            //SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}

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

