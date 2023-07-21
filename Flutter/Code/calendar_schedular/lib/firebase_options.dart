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
    apiKey: 'AIzaSyDdb8O1z842OqyiYLhSQTm_IJGayORAqc8',
    appId: '1:515483904388:web:9d588e9eba4a42c880d5d1',
    messagingSenderId: '515483904388',
    projectId: 'calendar-scheduler-hw0708',
    authDomain: 'calendar-scheduler-hw0708.firebaseapp.com',
    storageBucket: 'calendar-scheduler-hw0708.appspot.com',
    measurementId: 'G-5TKY72SN5M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBidiBoK8DbOIOZ2zBbDR5xmumPxvwios',
    appId: '1:515483904388:android:58c49bcd8a26b52880d5d1',
    messagingSenderId: '515483904388',
    projectId: 'calendar-scheduler-hw0708',
    storageBucket: 'calendar-scheduler-hw0708.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiAIgxBx8i2VQY_PlEhdGTGEob_Wv_rHQ',
    appId: '1:515483904388:ios:aed157641f2ded6680d5d1',
    messagingSenderId: '515483904388',
    projectId: 'calendar-scheduler-hw0708',
    storageBucket: 'calendar-scheduler-hw0708.appspot.com',
    iosClientId: '515483904388-3ehf3u3j39kp18be77fsi6r4mhe6hpun.apps.googleusercontent.com',
    iosBundleId: 'com.example.calendarSchedular',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiAIgxBx8i2VQY_PlEhdGTGEob_Wv_rHQ',
    appId: '1:515483904388:ios:19c0171c938bf1fa80d5d1',
    messagingSenderId: '515483904388',
    projectId: 'calendar-scheduler-hw0708',
    storageBucket: 'calendar-scheduler-hw0708.appspot.com',
    iosClientId: '515483904388-n7le940ng204tasi3jg4r184t0egi00c.apps.googleusercontent.com',
    iosBundleId: 'com.example.calendarSchedular.RunnerTests',
  );
}