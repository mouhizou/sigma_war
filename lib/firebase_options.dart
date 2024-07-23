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
    apiKey: 'AIzaSyAtcywsVzWv8c2Lp2BfJSD8D7wAo-yt1Vk',
    appId: '1:594832364999:web:25080aae7db4269732f5e2',
    messagingSenderId: '594832364999',
    projectId: 'sigmawore',
    authDomain: 'sigmawore.firebaseapp.com',
    storageBucket: 'sigmawore.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCQP3X-f6PtVONAUHlxbC2nq80xYbRZrc',
    appId: '1:594832364999:android:acec6ef01d60171b32f5e2',
    messagingSenderId: '594832364999',
    projectId: 'sigmawore',
    storageBucket: 'sigmawore.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQTpwy0iKm39Bz8IRcbUzfBZEPQJ1Xr7Y',
    appId: '1:594832364999:ios:ea93b000d8186fce32f5e2',
    messagingSenderId: '594832364999',
    projectId: 'sigmawore',
    storageBucket: 'sigmawore.appspot.com',
    iosBundleId: 'com.example.sigmaWor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQTpwy0iKm39Bz8IRcbUzfBZEPQJ1Xr7Y',
    appId: '1:594832364999:ios:ea93b000d8186fce32f5e2',
    messagingSenderId: '594832364999',
    projectId: 'sigmawore',
    storageBucket: 'sigmawore.appspot.com',
    iosBundleId: 'com.example.sigmaWor',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAtcywsVzWv8c2Lp2BfJSD8D7wAo-yt1Vk',
    appId: '1:594832364999:web:2b62181bb075069232f5e2',
    messagingSenderId: '594832364999',
    projectId: 'sigmawore',
    authDomain: 'sigmawore.firebaseapp.com',
    storageBucket: 'sigmawore.appspot.com',
  );
}
