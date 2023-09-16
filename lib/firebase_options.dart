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
    apiKey: 'AIzaSyBtvK61at08JIWkUPc1UjMDd5bIqoMbluw',
    appId: '1:307358839940:web:a2851429e1d600b3397ed1',
    messagingSenderId: '307358839940',
    projectId: 'e-commerce-app-707cd',
    authDomain: 'e-commerce-app-707cd.firebaseapp.com',
    storageBucket: 'e-commerce-app-707cd.appspot.com',
    measurementId: 'G-2YRVLSJEFJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0_iErIE2GqinfT6NmfY7gHtSs_39A_PI',
    appId: '1:307358839940:android:6ee078f9d5e41d21397ed1',
    messagingSenderId: '307358839940',
    projectId: 'e-commerce-app-707cd',
    storageBucket: 'e-commerce-app-707cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiGMa8etnVBC98JXEMU6pxLpr6orymtss',
    appId: '1:307358839940:ios:80e6ec4821c1676d397ed1',
    messagingSenderId: '307358839940',
    projectId: 'e-commerce-app-707cd',
    storageBucket: 'e-commerce-app-707cd.appspot.com',
    iosClientId: '307358839940-74n3022roupnfisocp7hrgn9sai125h2.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiGMa8etnVBC98JXEMU6pxLpr6orymtss',
    appId: '1:307358839940:ios:fff0064e420cf08d397ed1',
    messagingSenderId: '307358839940',
    projectId: 'e-commerce-app-707cd',
    storageBucket: 'e-commerce-app-707cd.appspot.com',
    iosClientId: '307358839940-ekb08f6gl1l7hu3f84c3ujfc60sof8fp.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceApp.RunnerTests',
  );
}
