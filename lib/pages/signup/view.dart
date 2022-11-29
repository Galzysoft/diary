import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SignupPage extends StatelessWidget {
  final logic = Get.put(SignupLogic());
  final state = Get.find<SignupLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/lucasss.jpg"), fit: BoxFit.fill)),
      child: Scaffold(appBar: AppBar(backgroundColor: Colors.transparent,),
          backgroundColor: Colors.black54,
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: logic .email,
                  style: TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Colors.black54,
                      filled: true),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: logic.password,

                  style: TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Colors.black54,
                      filled: true),
                ),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    logic.signUp();

                  }, child: Text("Sign Up")),
                )
              ],
            ),
          ))),
    );
  }
}
