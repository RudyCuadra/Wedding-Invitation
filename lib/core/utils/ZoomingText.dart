import 'package:flutter/material.dart';

class ZoomingText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  const ZoomingText({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  _ZoomingTextState createState() => _ZoomingTextState();
}

class _ZoomingTextState extends State<ZoomingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
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
        return Transform.scale(
          scale: _animation.value,
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: widget.textStyle,
          ),
        );
      },
    );
  }
}
