import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dairy/pages/notes/view.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  var processing = false.obs;

  Future Login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      processing.value = true;
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
         if  ( value.user.toString()!= null){
           print("Logged in successfully ${value.user}");
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
             return  NotesPage();
           },));
            return processing.value = false;}
          });

      processing.value = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: ListTile(
            leading: Icon(
              Icons.done_all_sharp,
            ),
            title: Text("login successfull"),
          )));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        processing.value = false;
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: ListTile(
              leading: Icon(
                Icons.error_outline,
              ),
              title: Text("No user found for that email."),
            )));
      } else if (e.code == 'wrong-password') {
        processing.value = false;
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: ListTile(
              leading: Icon(
                Icons.error_outline,
              ),
              title: Text("Wrong password provided for that user."),
            )));
      }
    }
  }
}
