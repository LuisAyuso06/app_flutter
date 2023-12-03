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
    apiKey: 'AIzaSyCrqqH4W7gXHgUO4CsOA-NtVNujbnMOi5g',
    appId: '1:799563359753:web:c1c2ac07fe0c220b50bad8',
    messagingSenderId: '799563359753',
    projectId: 'appprueba-15a6e',
    authDomain: 'appprueba-15a6e.firebaseapp.com',
    storageBucket: 'appprueba-15a6e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCApL0TVI8q5nM-Riyu8fT_uls2OAzKEGI',
    appId: '1:799563359753:android:b11471e40b93f33950bad8',
    messagingSenderId: '799563359753',
    projectId: 'appprueba-15a6e',
    storageBucket: 'appprueba-15a6e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL32SDYIiBG_kDMVLfSR0cqBu8sijX3dc',
    appId: '1:799563359753:ios:d8fa5db8ad93f13350bad8',
    messagingSenderId: '799563359753',
    projectId: 'appprueba-15a6e',
    storageBucket: 'appprueba-15a6e.appspot.com',
    iosBundleId: 'com.example.appPrueba',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL32SDYIiBG_kDMVLfSR0cqBu8sijX3dc',
    appId: '1:799563359753:ios:b893d4286330411850bad8',
    messagingSenderId: '799563359753',
    projectId: 'appprueba-15a6e',
    storageBucket: 'appprueba-15a6e.appspot.com',
    iosBundleId: 'com.example.appPrueba.RunnerTests',
  );
}