import 'package:flutter/material.dart';

class FlowerAnimation extends StatefulWidget {
  final String imagePath;
  final double width;
  final double? height; // Parámetro opcional de altura
  final Offset offset;
  final bool isLeftFlower; // Identificar si es flor izquierda o derecha

  const FlowerAnimation({
    Key? key,
    required this.imagePath,
    required this.width,
    this.height, // Se hace opcional
    required this.offset,
    required this.isLeftFlower,
  }) : super(key: key);

  @override
  _FlowerAnimationState createState() => _FlowerAnimationState();
}

class _FlowerAnimationState extends State<FlowerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repetir ida y vuelta

    _animation = Tween<double>(
      begin: widget.isLeftFlower ? -0.05 : 0.05, // Cambia el sentido del movimiento
      end: widget.isLeftFlower ? 0.05 : -0.05,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: widget.offset, // Mantiene el desplazamiento original
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value, // Aplica la animación de oscilación
            child: Image.asset(
              widget.imagePath,
              width: widget.width,
              height: widget.height, // Se aplica solo si no es null
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
