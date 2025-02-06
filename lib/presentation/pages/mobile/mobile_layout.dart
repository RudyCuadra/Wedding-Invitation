import 'package:flutter/material.dart';
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
}
