import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CreateNewNotePage extends StatelessWidget {
  final logic = Get.put(CreateNewNoteLogic());
  final state = Get.find<CreateNewNoteLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "All notes",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ]),
            ),

          ),
     SliverFillRemaining(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(children: [

           TextFormField(
             style: TextStyle(color: Colors.white),

             // controller: password,
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
           SizedBox(height: 10,),
           TextFormField(
             style: TextStyle(color: Colors.white),

             // controller: password,
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
           SizedBox(height: 10,),
           SizedBox(
             width: 300,
             child: Obx(() {
               return ElevatedButton(
                   onPressed: () {
                     logic.createNewNote(title: "ada jesus",note: "onyedika");
                   },
                   child: logic.processing.value == true
                       ? SizedBox(width: 20,height: 20,child: CircularProgressIndicator(color: Colors.white,))
                       : Text("submit note"));
             }),
           ),
         ]),
       ),
     )
        ],
      ),
       );
  }
}
