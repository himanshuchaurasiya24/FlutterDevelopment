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
    apiKey: 'AIzaSyDp5Ra-SR0puVq3o-izFcobdUy_bChbveI',
    appId: '1:607600861665:web:f78bff3b670e50e75a72a0',
    messagingSenderId: '607600861665',
    projectId: 'study-app-b2bbd',
    authDomain: 'study-app-b2bbd.firebaseapp.com',
    storageBucket: 'study-app-b2bbd.appspot.com',
    measurementId: 'G-B1548ENW41',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2M45p3MyYTiJeCy2gWc3z_24639OjTuk',
    appId: '1:607600861665:android:6047b5c8dbafb4855a72a0',
    messagingSenderId: '607600861665',
    projectId: 'study-app-b2bbd',
    storageBucket: 'study-app-b2bbd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_1irywCoJNYUkuWswiBZeucOHvQcMpRc',
    appId: '1:607600861665:ios:2ff977240b7959b15a72a0',
    messagingSenderId: '607600861665',
    projectId: 'study-app-b2bbd',
    storageBucket: 'study-app-b2bbd.appspot.com',
    iosClientId: '607600861665-e0qmeqe36op4dks6p7u4h5vis3gj56en.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_1irywCoJNYUkuWswiBZeucOHvQcMpRc',
    appId: '1:607600861665:ios:6322582a71f9433a5a72a0',
    messagingSenderId: '607600861665',
    projectId: 'study-app-b2bbd',
    storageBucket: 'study-app-b2bbd.appspot.com',
    iosClientId: '607600861665-sp6apg9ufjjfs9ubh4kuk6h2sdm808db.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyApp.RunnerTests',
  );
}
