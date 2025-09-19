import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController email=TextEditingController();

  reset() async {
  final String emailText = email.text.trim();

  if (emailText.isEmpty) {
    Get.snackbar('Error', 'Please enter your email');
    return;
  }

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailText);
    Get.snackbar('Success', 'Password reset link sent to your email');
  } on FirebaseAuthException catch (e) {
    String errorMessage;

    if (e.code == 'invalid-email') {
      errorMessage = 'The email address is not valid.';
    } else if (e.code == 'user-not-found') {
      errorMessage = 'No user found with this email.';
    } else {
      errorMessage = e.message ?? 'Failed to send reset link.';
    }

    Get.snackbar('Reset Failed', errorMessage);
  } catch (e) {
    Get.snackbar('Error', 'Something went wrong. Please try again.');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter email'),
            ),
            ElevatedButton(onPressed:(()=>reset()), child: Text("Send Link"))
          ],
        ),
      ),
    );
  }
}