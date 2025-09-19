import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutteranew/wrapper.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  //bool isloading=false;

  signup()async{
     final String emailText = email.text.trim();
  final String passwordText = password.text.trim();

  final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');

  if (!passwordRegex.hasMatch(passwordText)) {
    Get.snackbar(
      'Invalid Password',
      'Password must be at least 8 characters and include uppercase, lowercase, number.',
    );
    return;
  }

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailText,
      password: passwordText,
    );
    Get.offAll(Wrapper());
  } on FirebaseAuthException catch (e) {
    String errorMessage;

    if (e.code == 'invalid-email') {
      errorMessage = 'The email address is not valid.';
    } else if (e.code == 'email-already-in-use') {
      errorMessage = 'This email is already registered.';
    } else {
      errorMessage = e.message ?? 'Signup failed. Please try again.';
    }

    Get.snackbar('Signup Error', errorMessage);
  } catch (e) {
    Get.snackbar('Error', 'Something went wrong. Please try again.');
  }

    
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter email'),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'Enter password'),
            ),
            ElevatedButton(onPressed:(()=>signup()), child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}