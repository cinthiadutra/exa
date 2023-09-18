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
        return macos;
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
    apiKey: 'AIzaSyAmlybSlphFe5K6-bO4N6WcCa6dXCYX6hE',
    appId: '1:236383996818:web:0b67ef62e2a212c86d4f4b',
    messagingSenderId: '236383996818',
    projectId: 'todoexa',
    authDomain: 'todoexa.firebaseapp.com',
    databaseURL: 'https://todoexa-default-rtdb.firebaseio.com',
    storageBucket: 'todoexa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFHIuLDCpwIkMbnS4tycQCOifd6L9kG9c',
    appId: '1:236383996818:android:f10f09ab685c21716d4f4b',
    messagingSenderId: '236383996818',
    projectId: 'todoexa',
    databaseURL: 'https://todoexa-default-rtdb.firebaseio.com',
    storageBucket: 'todoexa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgz8wyl4_hEmzRGatIz_5CCYJmZ4dRorY',
    appId: '1:236383996818:ios:56e8261a84e3e3bc6d4f4b',
    messagingSenderId: '236383996818',
    projectId: 'todoexa',
    databaseURL: 'https://todoexa-default-rtdb.firebaseio.com',
    storageBucket: 'todoexa.appspot.com',
    iosBundleId: 'com.example.todoExa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgz8wyl4_hEmzRGatIz_5CCYJmZ4dRorY',
    appId: '1:236383996818:ios:1f4138e0166a84b96d4f4b',
    messagingSenderId: '236383996818',
    projectId: 'todoexa',
    databaseURL: 'https://todoexa-default-rtdb.firebaseio.com',
    storageBucket: 'todoexa.appspot.com',
    iosBundleId: 'com.example.todoExa.RunnerTests',
  );
}
