import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_1.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_2.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_3.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_4.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_5.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_6.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_7.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_8.dart';

import '../../../core/utils/ScrollControllerHandler.dart'; // Importa la clase

class DesktopLayout extends StatefulWidget {
  final int initialPage;

  const DesktopLayout({super.key, this.initialPage = 0});

  @override
  _DesktopLayoutState createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  late PageController _pageController;
  late ScrollControllerHandler _scrollHandler;
  bool usePageController = true; // Variable para cambiar entre paginación o scroll normal

  @override
  void initState() {
    super.initState();
    //_pageController = PageController(initialPage: widget.initialPage);
    final int validPage = (widget.initialPage >= 0 && widget.initialPage < 8) ? widget.initialPage : 0;
    _pageController = PageController(initialPage: validPage);
    _scrollHandler = ScrollControllerHandler(
      pageController: _pageController,
      onScrollModeChanged: (bool isMouse) {
        setState(() {
          usePageController = isMouse; // Si es mouse usa PageController, si no usa PageView normal
        });
      },
    );

    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final int currentPage = _pageController.page?.round() ?? 0;
    final String newPath = '/section/${currentPage + 1}';
    //GoRouter.of(context).go(newPath);
    if (GoRouter.of(context).routerDelegate.currentConfiguration != null) {
      GoRouter.of(context).go(newPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _scrollHandler.handleScroll, // Usa la clase externa
      child: usePageController
          ? PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(), // Bloquea scroll manual
        children: const [
          DesktopSection1(),
          DesktopSection2(),
          DesktopSection3(),
          DesktopSection4(),
          DesktopSection5(),
          DesktopSection6(),
          DesktopSection7(),
          DesktopSection8(),
        ],
      )
          : PageView(
        scrollDirection: Axis.vertical, // Scroll libre sin paginación
        children: const [
          DesktopSection1(),
          DesktopSection2(),
          DesktopSection3(),
          DesktopSection4(),
          DesktopSection5(),
          DesktopSection6(),
          DesktopSection7(),
          DesktopSection8(),
        ],
      ),
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_1.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_2.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_3.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_4.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_5.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_6.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_7.dart';
import 'package:nuestra_boda/presentation/pages/desktop/section_8.dart';

import '../../../core/utils/ScrollControllerHandler.dart'; // Importa la clase

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  _DesktopLayoutState createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final PageController _pageController = PageController();
  late ScrollControllerHandler _scrollHandler;

  @override
  void initState() {
    super.initState();
    _scrollHandler = ScrollControllerHandler(pageController: _pageController);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _scrollHandler.handleScroll, // Usa la clase externa
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(), // Bloquea scroll manual
        children: const [
          DesktopSection1(),
          DesktopSection2(),
          DesktopSection3(),
          DesktopSection4(),
          DesktopSection5(),
          DesktopSection6(),
          DesktopSection7(),
          DesktopSection8(),
        ],
      ),
    );
  }
}*/
/*
return PageView(
scrollDirection: Axis.vertical,
children: const [
DesktopSection1(),
DesktopSection2(),
DesktopSection3(),
DesktopSection4(),
DesktopSection5(),
DesktopSection6(),
DesktopSection7(),
DesktopSection8(),
],
);*/
