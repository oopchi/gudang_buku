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
    apiKey: 'AIzaSyAZkVv3VKza3lXpGeYDDsvMijziuzg18oA',
    appId: '1:81401705015:web:de73d735400c0a373e45b2',
    messagingSenderId: '81401705015',
    projectId: 'bookstore-2d8e6',
    authDomain: 'bookstore-2d8e6.firebaseapp.com',
    storageBucket: 'bookstore-2d8e6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo4frLUZI5E4U1Odu6wLKjhsXF3C_UJio',
    appId: '1:81401705015:android:26c8fefe12fb5fee3e45b2',
    messagingSenderId: '81401705015',
    projectId: 'bookstore-2d8e6',
    storageBucket: 'bookstore-2d8e6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbeq0FixcQDioQ5vMkbAQ67CS8Fqc0LZY',
    appId: '1:81401705015:ios:087a40f2e8dc65dc3e45b2',
    messagingSenderId: '81401705015',
    projectId: 'bookstore-2d8e6',
    storageBucket: 'bookstore-2d8e6.appspot.com',
    iosClientId: '81401705015-qfut49da2lt1970j4d4bfm7amcmnurhn.apps.googleusercontent.com',
    iosBundleId: 'com.oopchi.bookstore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbeq0FixcQDioQ5vMkbAQ67CS8Fqc0LZY',
    appId: '1:81401705015:ios:087a40f2e8dc65dc3e45b2',
    messagingSenderId: '81401705015',
    projectId: 'bookstore-2d8e6',
    storageBucket: 'bookstore-2d8e6.appspot.com',
    iosClientId: '81401705015-qfut49da2lt1970j4d4bfm7amcmnurhn.apps.googleusercontent.com',
    iosBundleId: 'com.oopchi.bookstore',
  );
}