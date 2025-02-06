import 'package:flutter/material.dart';
import '../widgets/responsive_layout.dart';
import 'dart:html' as html; // Solo se usa en Web
import 'desktop/desktop_layout.dart';
import 'mobile/mobile_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Método para recargar la página
  Future<void> _reloadPage() async {
    html.window.location.reload(); // Recargar la página en Flutter Web
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktop: const DesktopLayout(),
        mobile: const MobileLayout(),
      ),
    );
  }
}
