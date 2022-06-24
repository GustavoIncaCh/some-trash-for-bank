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
    apiKey: 'AIzaSyAH_NH1JdBzH7zyOuX1dkfv83WFYh3TL9I',
    appId: '1:588524411585:web:a6a3e48b3435e62d7d5240',
    messagingSenderId: '588524411585',
    projectId: 'bank-4282a',
    authDomain: 'bank-4282a.firebaseapp.com',
    databaseURL: 'https://bank-4282a-default-rtdb.firebaseio.com',
    storageBucket: 'bank-4282a.appspot.com',
    measurementId: 'G-Z0CD78Z993',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRSG3J-g7t6kMm8AmAOIPBFO1a6Tyiszw',
    appId: '1:588524411585:android:8e1c3b2f97fb29027d5240',
    messagingSenderId: '588524411585',
    projectId: 'bank-4282a',
    databaseURL: 'https://bank-4282a-default-rtdb.firebaseio.com',
    storageBucket: 'bank-4282a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQ85zIULGRqIMbqpIySgLLTB9AgJ8qOag',
    appId: '1:588524411585:ios:1efa174d49f9d9927d5240',
    messagingSenderId: '588524411585',
    projectId: 'bank-4282a',
    databaseURL: 'https://bank-4282a-default-rtdb.firebaseio.com',
    storageBucket: 'bank-4282a.appspot.com',
    iosClientId: '588524411585-qrv33u3mh07fq4u0gaji1csds7bf0mi7.apps.googleusercontent.com',
    iosBundleId: 'com.example.bank9780',
  );
}