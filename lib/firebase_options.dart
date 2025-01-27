// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCUqFbsgW_7lp0aizWkOP4zY6nszSDyyyI',
    appId: '1:658027803431:web:3eb028145007592c22ef02',
    messagingSenderId: '658027803431',
    projectId: 'eventapp-f22d0',
    authDomain: 'eventapp-f22d0.firebaseapp.com',
    storageBucket: 'eventapp-f22d0.appspot.com',
    measurementId: 'G-0GK96Q0BNF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnxBpasssKbskzVe6KfsqSSkY-3GqeZ7s',
    appId: '1:658027803431:android:50616f0cec9f470822ef02',
    messagingSenderId: '658027803431',
    projectId: 'eventapp-f22d0',
    storageBucket: 'eventapp-f22d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_rA-2TdUtpTyotmjLGTdj9HvMUer-YEI',
    appId: '1:658027803431:ios:7ba4df44f91c978522ef02',
    messagingSenderId: '658027803431',
    projectId: 'eventapp-f22d0',
    storageBucket: 'eventapp-f22d0.appspot.com',
    iosClientId: '658027803431-vf736qumpl1pujq0vu77d5e6pib2mbni.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_rA-2TdUtpTyotmjLGTdj9HvMUer-YEI',
    appId: '1:658027803431:ios:7ba4df44f91c978522ef02',
    messagingSenderId: '658027803431',
    projectId: 'eventapp-f22d0',
    storageBucket: 'eventapp-f22d0.appspot.com',
    iosClientId: '658027803431-vf736qumpl1pujq0vu77d5e6pib2mbni.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUqFbsgW_7lp0aizWkOP4zY6nszSDyyyI',
    appId: '1:658027803431:web:ef2baa9515277af022ef02',
    messagingSenderId: '658027803431',
    projectId: 'eventapp-f22d0',
    authDomain: 'eventapp-f22d0.firebaseapp.com',
    storageBucket: 'eventapp-f22d0.appspot.com',
    measurementId: 'G-H4204XST1V',
  );
}
