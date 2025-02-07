// mobile_layout.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'section_1.dart';
import 'section_2.dart';
import 'section_3.dart';
import 'section_4.dart';
import 'section_5.dart';
import 'section_6.dart';
import 'section_7.dart';
import 'section_8.dart';
import 'dart:html' as html; // Solo se usa en Web

class MobileLayout extends StatefulWidget {
  final int initialSection;

  const MobileLayout({super.key, this.initialSection = 1});

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  late PageController _pageController;

  Future<void> _reloadPage() async {
    html.window.location.reload();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialSection - 1);
  }

  void _navigateToSection(int index) {
    GoRouter.of(context).go('/section/${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollNotification>(
      onNotification: (OverscrollNotification notification) {
        if (notification.overscroll < 0) {
          _reloadPage(); // Recargar si el usuario intenta hacer scroll hacia abajo en la primera página
        }
        return false;
      },
      child: PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) => _navigateToSection(index),
      children: const [
        MobileSection1(),
        MobileSection2(),
        MobileSection3(),
        MobileSection4(),
        MobileSection5(),
        MobileSection6(),
        MobileSection7(),
        MobileSection8(),
      ],
    ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_3.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_4.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_5.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_6.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_7.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_8.dart';
import 'section_1.dart';
import 'section_2.dart';
import 'dart:html' as html; // Solo se usa en Web

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  Future<void> _reloadPage() async {
    html.window.location.reload();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollNotification>(
      onNotification: (OverscrollNotification notification) {
        if (notification.overscroll < 0) {
          _reloadPage(); // Recargar si el usuario intenta hacer scroll hacia abajo en la primera página
        }
        return false;
      },
      child: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          MobileSection1(), // Primera sección
          MobileSection2(),
          MobileSection3(),
          MobileSection4(),
          MobileSection5(),
          MobileSection6(),
          MobileSection7(),
          MobileSection8(),
        ],
      ),
    );
  }
}*/
