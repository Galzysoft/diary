import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  Future Login({required String email, required String password,required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: ListTile(
            leading: Icon(Icons.done_all_sharp,),
            title: Text("login successfull"),)));

    } on FirebaseAuthException catch (e) {
      if (e .code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: ListTile(
              leading: Icon(Icons.error_outline,),
              title: Text("No user found for that email."),)));


      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: ListTile(
              leading: Icon(Icons.error_outline,),
              title: Text("Wrong password provided for that user."),)));

      }
    }
  }
}
