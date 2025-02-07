import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:nuestra_boda/presentation/pages/confirmar_asistencia.dart';
import 'package:nuestra_boda/presentation/pages/home_page.dart';// Importa la pantalla de carga
import 'core/theme/theme.dart';
import 'core/utils/SplashScreen.dart';
import 'firebase_options.dart';

// 1️⃣ Define GoRouter fuera del widget MyApp
/*final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(path: '/confirmar', builder: (context, state) => ConfirmarAsistencia()),
  ],
);*/

final GoRouter _router = GoRouter(
  initialLocation: '/section/1',
  routes: [
    GoRoute(
      path: '/section/:id',
      builder: (context, state) {
        final sectionId = int.tryParse(state.pathParameters['id'] ?? '1') ?? 1;
        return HomePage(initialSection: sectionId);
      },
    ),
    GoRoute(
      path: '/confirmar',
      builder: (context, state) => ConfirmarAsistencia(),
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "web/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInitialized = false;

  void _onInitializationComplete() {
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Boda Cuadra Orozco',
      theme: appTheme,
      routerConfig: _router,
      builder: (context, child) {
        return _isInitialized ? child! : SplashScreen(onInitializationComplete: _onInitializationComplete);
      },
    );
  }
}
