// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleLogin extends StatefulWidget {
//   const GoogleLogin({super.key});

//   @override
//   State<GoogleLogin> createState() => _GoogleLoginState();
// }


// Future<void> signInWithGoogle() async {
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   if (googleUser == null) {
//     // Пользователь отменил вход
//     return;
//   }

//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   await FirebaseAuth.instance.signInWithCredential(credential);
// }


// class _GoogleLoginState extends State<GoogleLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text('login'),
//     );
//   }
// }