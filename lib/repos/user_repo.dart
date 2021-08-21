import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late String? name;
  late String? imageUrl;

  late bool authSignedIn;
  late String? uid;
  late String? userEmail;

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    if (user != null) {
      uid = user.uid;
      name = user.displayName!;
      userEmail = user.email!;
      imageUrl = user.photoURL!;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('auth', user.uid);

      return user;
    }

    return null;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    await _auth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('auth', "");

    uid = null;
    name = null;
    userEmail = null;
    imageUrl = null;

    print("User signed out of Google account");
  }

  User? getUser() {
    return _auth.currentUser;
  }
}
