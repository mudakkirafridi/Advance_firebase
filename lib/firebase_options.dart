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
    apiKey: 'AIzaSyAnyvBjUvC4EOnl35UEupKbrLui8d5wPt8',
    appId: '1:955426049527:web:91725177acca57f1ee72f2',
    messagingSenderId: '955426049527',
    projectId: 'advance-firebase-402e5',
    authDomain: 'advance-firebase-402e5.firebaseapp.com',
    storageBucket: 'advance-firebase-402e5.appspot.com',
    measurementId: 'G-169WG7WGBY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBup1S0G8lWk1EvriGNcFegCOt_THBMNUA',
    appId: '1:955426049527:android:61f7215482dcb19fee72f2',
    messagingSenderId: '955426049527',
    projectId: 'advance-firebase-402e5',
    storageBucket: 'advance-firebase-402e5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyrcgMh0Q2dCUwd5lAdkrP5kbXeX3zLbc',
    appId: '1:955426049527:ios:65ed89e14170c01bee72f2',
    messagingSenderId: '955426049527',
    projectId: 'advance-firebase-402e5',
    storageBucket: 'advance-firebase-402e5.appspot.com',
    iosBundleId: 'com.example.advanceFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyrcgMh0Q2dCUwd5lAdkrP5kbXeX3zLbc',
    appId: '1:955426049527:ios:9eb4d5df97dd27aaee72f2',
    messagingSenderId: '955426049527',
    projectId: 'advance-firebase-402e5',
    storageBucket: 'advance-firebase-402e5.appspot.com',
    iosBundleId: 'com.example.advanceFirebase.RunnerTests',
  );
}
