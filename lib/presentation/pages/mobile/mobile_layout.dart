import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_3.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_4.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_5.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_6.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_7.dart';
import 'package:nuestra_boda/presentation/pages/mobile/section_8.dart';
import 'section_1.dart';
import 'section_2.dart';
import 'dart:html' as html; // Solo se usa en Web

class MobileLayout extends StatefulWidget {
  final int initialPage;

  const MobileLayout({super.key, this.initialPage = 0});

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    //_pageController = PageController(initialPage: widget.initialPage);
    final int validPage = (widget.initialPage >= 0 && widget.initialPage < 8) ? widget.initialPage : 0;
    _pageController = PageController(initialPage: validPage);
    _pageController.addListener(_onPageChanged); // Agregar listener para sincronizar con la URL
  }

  void _onPageChanged() {
    final int currentPage = _pageController.page?.round() ?? 0;
    final String newPath = '/section/${currentPage + 1}';

    final currentConfig = GoRouter.of(context).routerDelegate.currentConfiguration;
    final String currentPath = currentConfig?.uri.toString() ?? '/';


    // Obtener la ruta actual
    //final String currentPath = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    //('newPath $newPath');
    //print('currentPath $currentPath');
    //debugPrint('Este es otro mensaje de prueba');
    // Solo navegar si la ruta actual es diferente a la nueva ruta

    if(newPath=='/confirmar' || newPath=='/section/7'){
      GoRouter.of(context).go(newPath);
    }else{
      html.window.history.pushState(null, '', newPath);
    }

    /*if (currentPath != newPath) {
      GoRouter.of(context).go(newPath);
    }*/

    // Actualizar la URL sin forzar una reconstrucción de la página
    //html.window.history.pushState(null, '', newPath);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged); // Limpiar el listener
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _reloadPage() async {
    html.window.location.reload();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollNotification>(
      onNotification: (OverscrollNotification notification) {
        if (notification.overscroll < 0 && _pageController.page == 0) {
          _reloadPage();
        }
        return false;
      },
      child: PageView(
        controller: _pageController, // Usar el PageController
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