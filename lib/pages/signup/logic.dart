import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class SignupLogic extends GetxController {
  final SignupState state = SignupState();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var processing = false.obs;
  Future signUp({required BuildContext context}) async {
    try {
      processing.value = true;
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      processing.value = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: ListTile(
            leading: Icon(Icons.done_all_rounded,),
            title: Text("sign up successfull"),)));


    } on FirebaseAuthException catch (e) {
      processing.value = false;
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: ListTile(
              leading: Icon(
                Icons.error_outline,
              ),
              title: Text("The password provided is too weak."),
            )));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') { processing.value = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: ListTile(
              leading: Icon(
                Icons.error_outline,
              ),
              title: Text("The account already exists for that email."),
            )));

        print('The account already exists for that email.');
      }
    } catch (e) {
      processing.value = false;
      print(e);
    }
  }
}
