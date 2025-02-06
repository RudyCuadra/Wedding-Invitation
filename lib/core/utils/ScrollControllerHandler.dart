import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ScrollControllerHandler {
  final PageController pageController;
  final Function(bool isMouse) onScrollModeChanged; // Callback para notificar si es mouse o touchpad
  bool lastWasMouse = true; // Para evitar cambios innecesarios

  ScrollControllerHandler({required this.pageController, required this.onScrollModeChanged});

  void handleScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      double delta = event.scrollDelta.dy;

      bool isMouse = _isMouseScroll(delta);
      if (lastWasMouse != isMouse) {
        lastWasMouse = isMouse;
        onScrollModeChanged(isMouse); // Notifica a DesktopLayout que cambie el modo de scroll
      }

      if (isMouse) {
        if (delta > 0) {
          _nextPage();
        } else if (delta < 0) {
          _previousPage();
        }
      }
    }
  }

  bool _isMouseScroll(double delta) {
    return delta.abs() > 40; // Si el desplazamiento es grande, asumimos que es un mouse
  }

  void _nextPage() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}



/*import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ScrollControllerHandler {
  final PageController pageController;

  ScrollControllerHandler({required this.pageController});

  void handleScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (event.scrollDelta.dy > 0) {
        _nextPage();
      } else if (event.scrollDelta.dy < 0) {
        _previousPage();
      }
    }
  }

  void _nextPage() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}*/
