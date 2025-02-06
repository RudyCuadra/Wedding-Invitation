import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String imagePath;
  final double positionOffset;
  final double width;
  final double height;

  const BackgroundImage({super.key, required this.imagePath, this.width= 0, this.height= 0,this.positionOffset = 0});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -positionOffset, // Desplazar la imagen hacia abajo
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
