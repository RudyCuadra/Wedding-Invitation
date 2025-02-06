import 'package:flutter/material.dart';

class FadeInUpAnimation extends StatefulWidget {
  final Widget child;

  const FadeInUpAnimation({Key? key, required this.child}) : super(key: key);

  @override
  _FadeInUpAnimationState createState() => _FadeInUpAnimationState();
}

class _FadeInUpAnimationState extends State<FadeInUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2), // Empieza un poco más abajo
      end: Offset(0, 0), // Termina en su posición normal
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Iniciar la animación automáticamente
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
