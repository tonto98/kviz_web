import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kviz_web/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late String? name;
  late String? imageUrl;

  late bool authSignedIn;
  late String? uid;
  late String? userEmail;

  User? user;

  init() async{
    await getUser();
  }

  Future<User?> signInWithGoogle() async {
    await _auth.setPersistence(auth.Persistence.LOCAL);

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final auth.UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    final auth.User? user = userCredential.user;

    if (user != null) {
      uid = user.uid;
      name = user.displayName!;
      userEmail = user.email!;
      imageUrl = user.photoURL!;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('auth', user.uid);
      print("wrote ${user.uid} to prefs");
      return User(
        email: user.email,
        name: user.displayName,
        id: user.uid,
        isAdmin: false,
        photoUrl: user.photoURL,
        uid: user.uid,
      );
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

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = prefs.getString("auth") ?? "";
    print("read $uid from prefs");
    if (uid == ""){
      return null;
    }

    // TODO: neki try catch oko ovoga, ovo moze failat
    final response = await http.get(
      Uri.parse(
          "https://us-central1-kviz-a185e.cloudfunctions.net/getUser?uid=$uid"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*/*",
        "Accept-Encodig": "gzip, deflate, br",
        "Connection": "keep-alive"
      },
    );
    final user = User.fromJson(jsonDecode(response.body));
    this.user = user;

    // dont do this, change this for the love of sweet god please
    name = user.name;
    uid = user.uid!;
    userEmail = user.email;
    imageUrl = user.photoUrl;
    return user;
  }
}
