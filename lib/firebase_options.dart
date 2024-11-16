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
    apiKey: 'AIzaSyCa1IL2QGsSQCPJQ0iBMfJJopZFcxln6h0',
    appId: '1:256111579016:web:db55f4a500ad65f704343d',
    messagingSenderId: '256111579016',
    projectId: 'chronicle-cd4a0',
    authDomain: 'chronicle-cd4a0.firebaseapp.com',
    storageBucket: 'chronicle-cd4a0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD80LZreTFWzw_EnDl6oGpsb9UNfvDWy6Q',
    appId: '1:256111579016:android:2cfa0deb483860c204343d',
    messagingSenderId: '256111579016',
    projectId: 'chronicle-cd4a0',
    storageBucket: 'chronicle-cd4a0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvAEVSnHzj09Db79DJ7Z0CJyRZUypB3Lg',
    appId: '1:256111579016:ios:929a76c1a8736d8904343d',
    messagingSenderId: '256111579016',
    projectId: 'chronicle-cd4a0',
    storageBucket: 'chronicle-cd4a0.firebasestorage.app',
    iosBundleId: 'com.chronicle.chronicle',
  );
}
