import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SignupPage extends StatelessWidget {
  final logic = Get.put(SignupLogic());
  final state = Get.find<SignupLogic>().state;
final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(key:formkey ,
      child: Container(
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
                    height: 30,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    controller: logic.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "pls enter  your username";
                      }else {
                        if (!value!.isEmail) {
                          return "pls enter  a valid Email";
                        }}
                    },
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white,fontSize: 23),
                        errorStyle:  TextStyle(color: Colors.deepOrange,fontSize: 23),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fillColor: Colors.black54,
                        filled: true),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "pls enter  your password";
                      }
                      else if  (value!.length<6) {
                        return "pls enter  a valid password";
                      }
                    },
                    controller: logic.password,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        errorStyle:  TextStyle(color: Colors.deepOrange,fontSize: 23),

                        labelStyle: TextStyle(color: Colors.white,fontSize: 23),

                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2),
                            borderRadius: BorderRadius.circular(20)),
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
                    child: Obx(() {
                      return ElevatedButton(
                          onPressed: () {
                            if(formkey.currentState!.validate()) {
                              {
                                logic.signUp(
                                    context: context,
                                  );
                              }
                            }
                          },
                          child: logic.processing.value == true
                              ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                              : Text("Sign Up"));
                    }),
                  )
                ],
              ),
            ))),
      ),
    );
  }
}
