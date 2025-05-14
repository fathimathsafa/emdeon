import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'AIzaSyCwuEUWdbpos0Ys-B_FyHu9N5LRoX5Br28',
      appId: '1:122275663184:android:0c93089d312c269be77055',
      messagingSenderId: '122275663184',
      projectId: 'tracker-1e0f8',
      storageBucket: 'tracker-1e0f8.appspot.com',
    //  databaseURL: 'https://tracker-1e0f8-default-rtdb.firebaseio.com',
    );
  }
}
