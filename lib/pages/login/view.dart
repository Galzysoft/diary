import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dairy/pages/signup/view.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.put(LoginLogic());
  final state = Get
      .find<LoginLogic>()
      .state;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/lucasss.jpg"), fit: BoxFit.fill)),
      child: Scaffold(
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
                      "Login",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      controller: email,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(


                              borderSide: BorderSide(
                                  color: Colors.deepOrange, width: 2),
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

                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepOrange, width: 2),
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
                              logic.Login(context: context,
                                  email: email.text,
                                  password: password.text);
                            },
                            child: logic.processing.value == true
                                ? CircularProgressIndicator()
                                : Text("Login"));
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(color: Colors.deepOrange),
                          )),
                    )
                  ],
                ),
              ))),
    );
  }
}
