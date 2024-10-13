
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../firebase_options.dart';
class Services {
  static final Services _instance = Services._internal();

  factory Services() => _instance;

  Services._internal();
  late final FirebaseApp app;
  // late final FirebaseAuth auth;
  bool shouldUseFirebaseEmulator = false;

  /// using BaseFirebaseServices when disable the Firebase
  Future<void> init() async {
    // app=  await Firebase.initializeApp(
    //     // options: DefaultFirebaseOptions.currentPlatform,
    // );
    // auth = FirebaseAuth.instanceFor(app: app);
    // if (shouldUseFirebaseEmulator) {
    //   await auth.useAuthEmulator('localhost', 9099);
    // }
  }

}
