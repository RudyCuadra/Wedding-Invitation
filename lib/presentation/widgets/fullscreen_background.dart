import 'package:flutter/material.dart';

class FullscreenBackground extends StatelessWidget {
  final String imagePath;
  final double positionOffset;

  const FullscreenBackground({super.key, required this.imagePath, this.positionOffset = 0});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Ajusta la imagen para cubrir toda la pantalla
      ),
    );
    /*return Positioned(
      bottom: -positionOffset,
      child: Image.asset(
        imagePath,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );*/
  }
}
