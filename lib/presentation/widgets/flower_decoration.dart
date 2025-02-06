import 'package:flutter/material.dart';
import '../../core/constans/assets.dart';

class FlowerDecoration extends StatelessWidget {
  final double leftWidth;
  final double rightWidth;

  const FlowerDecoration({super.key, required this.leftWidth, required this.rightWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90), // Mueve hacia abajo 50 píxeles
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets.flowersLeftNew,
            width: leftWidth,
            height: 210,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppAssets.flowersRightNew,
            width: rightWidth,
            height: 210,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
