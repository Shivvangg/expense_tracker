// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDHRlRUvWOS-phXTEWoipKFAjLRdz9xLX0',
    appId: '1:472851029670:web:eff6fdcdafe2b3d776de67',
    messagingSenderId: '472851029670',
    projectId: 'expense-tracker-app-bb675',
    authDomain: 'expense-tracker-app-bb675.firebaseapp.com',
    storageBucket: 'expense-tracker-app-bb675.appspot.com',
    measurementId: 'G-N0SWWRZT04',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3PwICnUAsP20gl2sJB75jIq_GnG5MKNM',
    appId: '1:472851029670:android:ca5252a55086844576de67',
    messagingSenderId: '472851029670',
    projectId: 'expense-tracker-app-bb675',
    storageBucket: 'expense-tracker-app-bb675.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCM7BohLMJAKofs1R3Zw-YdHJDaGoag3b0',
    appId: '1:472851029670:ios:9d781bdff2da98a076de67',
    messagingSenderId: '472851029670',
    projectId: 'expense-tracker-app-bb675',
    storageBucket: 'expense-tracker-app-bb675.appspot.com',
    iosBundleId: 'com.example.expenseTracker',
  );
}
