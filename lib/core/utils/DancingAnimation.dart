import 'package:flutter/material.dart';

class DancingAnimation extends StatefulWidget {
  final Widget child; // Acepta cualquier widget como hijo

  const DancingAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _DancingAnimationState createState() => _DancingAnimationState();
}

class _DancingAnimationState extends State<DancingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true); // Repite la animación de forma inversa

    _animation = Tween<double>(begin: -0.05, end: 0.05).animate(
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          child: widget.child, // Aplica la animación al widget hijo
        );
      },
    );
  }
}
