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
    apiKey: 'AIzaSyAxviPu6PEH7lZJNrQlCgGu6dIQ7oUIzDA',
    appId: '1:193004733870:web:cdce23c20caf7ab14bf43f',
    messagingSenderId: '193004733870',
    projectId: 'azan-ffb4e',
    authDomain: 'azan-ffb4e.firebaseapp.com',
    storageBucket: 'azan-ffb4e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcw51Xk9zx4FLYvT_pt0z3hDSNjbsxlYg',
    appId: '1:193004733870:android:348d007c18befdd04bf43f',
    messagingSenderId: '193004733870',
    projectId: 'azan-ffb4e',
    storageBucket: 'azan-ffb4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlMgTZPQkWPALKppAj9l1MPneV6Q2MBL0',
    appId: '1:193004733870:ios:0072e63aaf5cc64b4bf43f',
    messagingSenderId: '193004733870',
    projectId: 'azan-ffb4e',
    storageBucket: 'azan-ffb4e.appspot.com',
    iosBundleId: 'com.example.azan',
  );
}