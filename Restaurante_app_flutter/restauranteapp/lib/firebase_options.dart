
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'show defaultTargetPlatform, kIsWeb, TargetPlatform;
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
   apiKey: " API do Firebase",
  authDomain: "food-delivery-9531f.firebaseapp.com",
  databaseURL: "https://food-delivery-9531f-default-rtdb.firebaseio.com",
  projectId: "food-delivery-9531f",
  storageBucket: "food-delivery-9531f.appspot.com",
  messagingSenderId: "154390909762",
  appId: "1:154390909762:web:61cdc8933aabf869e22edb",
  measurementId: "G-N2HLE3TY63",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHkBUtcN6-2e6khn3l8pb-Vw0mfcbb3fM',
    appId: '1:154390909762:android:60556c9298ed2158e22edb',
    messagingSenderId: '406099696497',
    projectId: 'food-delivery-9531f',
    databaseURL:
        'https://food-delivery-9531f-default-rtdb.firebaseio.com/',
    storageBucket: 'gs://food-delivery-9531f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHkBUtcN6-2e6khn3l8pb-Vw0mfcbb3fM',
    appId: '1:154390909762:android:60556c9298ed2158e22edb',
    messagingSenderId: '406099696497',
    projectId: 'food-delivery-9531f',
    databaseURL:
        'https://food-delivery-9531f-default-rtdb.firebaseio.com/',
    storageBucket: 'gs://food-delivery-9531f.appspot.com',
    androidClientId:
        '406099696497-17qn06u8a0dc717u8ul7s49ampk13lul.apps.googleusercontent.com',
    iosClientId:
        '406099696497-65v1b9ffv6sgfqngfjab5ol5qdikh2rm.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebaseUiExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAHkBUtcN6-2e6khn3l8pb-Vw0mfcbb3fM',
    appId: '1:154390909762:android:60556c9298ed2158e22edb',
    messagingSenderId: '154390909762',
    projectId: 'food-delivery-9531f',
    databaseURL:
        'https://food-delivery-9531f-default-rtdb.firebaseio.com/',
    storageBucket: 'gs://food-delivery-9531f.appspot.com',
    androidClientId:
        '406099696497-17qn06u8a0dc717u8ul7s49ampk13lul.apps.googleusercontent.com',
    iosClientId:
        '406099696497-65v1b9ffv6sgfqngfjab5ol5qdikh2rm.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebaseUiExample',
  );
}
