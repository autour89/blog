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
    apiKey: 'AIzaSyCCx0AU1Zit1kGTPpPBSMnGn1kInaqbXKE',
    appId: '1:510573753543:web:e25856f4bfe3c83765bae2',
    messagingSenderId: '510573753543',
    projectId: 'maleva-studio',
    authDomain: 'maleva-studio.firebaseapp.com',
    databaseURL: 'https://maleva-studio-default-rtdb.firebaseio.com',
    storageBucket: 'maleva-studio.appspot.com',
    measurementId: 'G-EPRGK748LN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASzC9oRW78iAFZPUtign2hPNa5wPDnFhY',
    appId: '1:510573753543:android:fe183cd278419c4f65bae2',
    messagingSenderId: '510573753543',
    projectId: 'maleva-studio',
    databaseURL: 'https://maleva-studio-default-rtdb.firebaseio.com',
    storageBucket: 'maleva-studio.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCg3fVQVh-s3y61mAzEULYRly95-JvIzKs',
    appId: '1:510573753543:ios:02ac4813dd2a522365bae2',
    messagingSenderId: '510573753543',
    projectId: 'maleva-studio',
    databaseURL: 'https://maleva-studio-default-rtdb.firebaseio.com',
    storageBucket: 'maleva-studio.appspot.com',
    iosClientId: '510573753543-165dor40f0epc8t4dalssjehuefkaoid.apps.googleusercontent.com',
    iosBundleId: 'com.malevastudio.blog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCg3fVQVh-s3y61mAzEULYRly95-JvIzKs',
    appId: '1:510573753543:ios:02ac4813dd2a522365bae2',
    messagingSenderId: '510573753543',
    projectId: 'maleva-studio',
    databaseURL: 'https://maleva-studio-default-rtdb.firebaseio.com',
    storageBucket: 'maleva-studio.appspot.com',
    iosClientId: '510573753543-165dor40f0epc8t4dalssjehuefkaoid.apps.googleusercontent.com',
    iosBundleId: 'com.malevastudio.blog',
  );
}
