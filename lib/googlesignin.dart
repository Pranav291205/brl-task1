/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google extends StatefulWidget {
  const Google({super.key});

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  google() async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential= GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken:googleAuth?.idToken, 
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (()=>google()),
          child: Padding(padding: const EdgeInsets.all(8.0),
          child: Text("Sign in with google",),),
        ),
      )
    );
  }
}*/