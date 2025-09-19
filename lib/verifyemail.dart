import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutteranew/homepage.dart';
// ignore: unused_import
import 'package:flutteranew/login.dart';
import 'package:flutteranew/wrapper.dart';
import 'package:get/get.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  @override
  void initState(){
    sendverifyLink();
    super.initState();
  }
  sendverifyLink() async{
    final user =FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value)=>{
      Get.snackbar('Link sent','A link has been sent to your email',margin: EdgeInsets.all(30),snackPosition: SnackPosition.BOTTOM)
    });
  }
  reload()async{
    await FirebaseAuth.instance.currentUser!.reload().then((value)=> {Get.offAll(Wrapper())});
  }
    signout()async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Verification"),),
      body: Padding(padding: const EdgeInsets.all(28.0),
      child: Center(
        child: Text('Open your mail box to verify mail and reload the page')
      ),
     ),
     floatingActionButton: FloatingActionButton(onPressed: (()=>signout()),
     child: Icon((Icons.restart_alt_rounded)),
     ),
     
     
     );
  }
}