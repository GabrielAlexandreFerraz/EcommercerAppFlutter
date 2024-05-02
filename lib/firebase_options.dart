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
    apiKey: 'AIzaSyCwJg8raiLLQxGFE_S1ITSJcFuqYlvWAYw',
    appId: '1:28221609502:web:f5787c20e3395c0719c00f',
    messagingSenderId: '28221609502',
    projectId: 'flutterecommerceappp',
    authDomain: 'flutterecommerceappp.firebaseapp.com',
    storageBucket: 'flutterecommerceappp.appspot.com',
    measurementId: 'G-F4GEXQ8PTL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDK5k5A9bntPOYPDIU5ScMyyfQF51xuVVI',
    appId: '1:28221609502:android:0134f38de2096a4e19c00f',
    messagingSenderId: '28221609502',
    projectId: 'flutterecommerceappp',
    storageBucket: 'flutterecommerceappp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXgkCPYRI2gElCrctCIbfdC5xNur4BRtg',
    appId: '1:28221609502:ios:2b3682b92c59b40119c00f',
    messagingSenderId: '28221609502',
    projectId: 'flutterecommerceappp',
    storageBucket: 'flutterecommerceappp.appspot.com',
    iosBundleId: 'com.example.ecommerceappfluttter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXgkCPYRI2gElCrctCIbfdC5xNur4BRtg',
    appId: '1:28221609502:ios:2b3682b92c59b40119c00f',
    messagingSenderId: '28221609502',
    projectId: 'flutterecommerceappp',
    storageBucket: 'flutterecommerceappp.appspot.com',
    iosBundleId: 'com.example.ecommerceappfluttter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwJg8raiLLQxGFE_S1ITSJcFuqYlvWAYw',
    appId: '1:28221609502:web:30d9d3c3cbbf310c19c00f',
    messagingSenderId: '28221609502',
    projectId: 'flutterecommerceappp',
    authDomain: 'flutterecommerceappp.firebaseapp.com',
    storageBucket: 'flutterecommerceappp.appspot.com',
    measurementId: 'G-YW69936ZKJ',
  );
}
