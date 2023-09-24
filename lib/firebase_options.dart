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
    apiKey: 'AIzaSyDfHKFlVSI-MFTjf-b0F8Sir76V3x2MRn0',
    appId: '1:207405962845:web:fb36ecaeb435e048959fb4',
    messagingSenderId: '207405962845',
    projectId: 'meditation-flutter',
    authDomain: 'meditation-flutter.firebaseapp.com',
    storageBucket: 'meditation-flutter.appspot.com',
    measurementId: 'G-TSS1FZ7CMN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVKAXlIaGwCwKlv-qz4kC3zd4fxk8jONo',
    appId: '1:207405962845:android:d4521a6b785b7749959fb4',
    messagingSenderId: '207405962845',
    projectId: 'meditation-flutter',
    storageBucket: 'meditation-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8jHtnbI1C7P-8WCle1WRYVQDtKsHKD9A',
    appId: '1:207405962845:ios:1d86441972fad03f959fb4',
    messagingSenderId: '207405962845',
    projectId: 'meditation-flutter',
    storageBucket: 'meditation-flutter.appspot.com',
    iosClientId: '207405962845-a4c8kvjslc9lem8t99757e63ukj0d7l7.apps.googleusercontent.com',
    iosBundleId: 'com.example.imageGalally',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8jHtnbI1C7P-8WCle1WRYVQDtKsHKD9A',
    appId: '1:207405962845:ios:1d86441972fad03f959fb4',
    messagingSenderId: '207405962845',
    projectId: 'meditation-flutter',
    storageBucket: 'meditation-flutter.appspot.com',
    iosClientId: '207405962845-a4c8kvjslc9lem8t99757e63ukj0d7l7.apps.googleusercontent.com',
    iosBundleId: 'com.example.imageGalally',
  );
}
