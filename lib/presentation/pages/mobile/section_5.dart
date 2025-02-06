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

class MobileSection5 extends StatelessWidget {
  const MobileSection5({super.key});

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
              "Acompañanos en\nnuestra ceremonia",
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
              AppAssets.iconoLocation,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 50,),
            FadeInUpAnimation(
              child: Text(
                "Carretera a Masaya, km 11.1, de Plaza Las\nPraderas 30 metros abajo.",
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
              "Carretera a Masaya, km 11.1, de Plaza Las\nPraderas 30 metros abajo.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                //height: 0.8,
                fontWeight: FontWeight.w500,
                color: Colors.brown[700],
                fontFamily: 'InriaSerif',
              ),
            ),*/
            SizedBox(height: 80,),
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse("https://maps.app.goo.gl/1DR2ybA5kJzgbjNX8");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print("No se pudo abrir el enlace");
                }
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
                  Icon(Icons.location_on, color: textColorButtom), // Ícono de ubicación
                  SizedBox(width: 10), // Espaciado entre el ícono y el texto
                  Text("Abrir Ubicación"),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Spacer(), // Esto empuja todo hacia arriba y deja espacio abajo
          ],
        ),

        Positioned(bottom:-10, left: 0, right: 0, child: FlowerDecoration2(leftWidth: screenWidth * 0.4, rightWidth: screenWidth * 0.4),),
      ],
    );


  }
}
