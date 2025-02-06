import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY_WEB']!,
      appId: dotenv.env['FIREBASE_APP_ID_WEB']!,
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID_WEB']!,
      projectId: dotenv.env['FIREBASE_PROJECT_ID_WEB']!,
      authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN_WEB']!,
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET_WEB']!,
      measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID_WEB']!,
    );
  }
}
