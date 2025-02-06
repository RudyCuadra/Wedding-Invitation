import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/utils/FadeInUpAnimation.dart';

class ParrafoInvitation extends StatelessWidget {
  final double titleSize;
  final double nameSize;
  final bool desktop;

  const ParrafoInvitation({super.key, required this.titleSize, required this.nameSize, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //const SizedBox(height: 150),
        /*Text(
          desktop
              ? 'Estamos muy emocionados de dar este gran paso y\nfelices de compartirlo contigo.\nEn esta página encontrarás todos los detalles de\nnuestro día especial.'
              : 'Estamos muy emocionados de dar este\n gran paso y felices de compartirlo\n contigo.En esta página encontrarás\n todos los detalles de nuestro día\n especial.',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.2,
            fontFamily: 'AlexBrush',
            fontSize: nameSize,
            color: textColor,
          ),
        ),*/
        FadeInUpAnimation(
          child: Text(
            desktop
            ? 'Estamos muy emocionados de dar este gran paso y\nfelices de compartirlo contigo.\nEn esta página encontrarás todos los detalles de\nnuestro día especial.'
              : 'Estamos muy emocionados de dar este\n gran paso y felices de compartirlo\n contigo. En esta página encontrarás\n todos los detalles de nuestro día\n especial.',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
                fontFamily: 'AlexBrush',
                fontSize: nameSize,
                color: textColor,
              ),
          ),
        ),
        SizedBox(height: 125),
      ],
    );
  }
}
