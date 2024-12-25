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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAibl877ZhTQYw9pQ6dDymlbtKG7CLWNA4',
    appId: '1:356471534096:android:debd7ede4a151de9fe5095',
    messagingSenderId: '356471534096',
    projectId: 'aniflow-fea18',
    storageBucket: 'aniflow-fea18.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5xln87eOfyfUaciHAZFCl9BaFJJASss4',
    appId: '1:356471534096:ios:a02f2d86cf503e09fe5095',
    messagingSenderId: '356471534096',
    projectId: 'aniflow-fea18',
    storageBucket: 'aniflow-fea18.firebasestorage.app',
    iosBundleId: 'com.andannn.animetracker.animeTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5xln87eOfyfUaciHAZFCl9BaFJJASss4',
    appId: '1:356471534096:ios:0750bc7d0878ee3ffe5095',
    messagingSenderId: '356471534096',
    projectId: 'aniflow-fea18',
    storageBucket: 'aniflow-fea18.firebasestorage.app',
    iosBundleId: 'com.andannn.aniflow',
  );

}