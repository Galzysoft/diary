import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CreateNewNotePage extends StatelessWidget {
  final String ?title;
  final String ?note;
  final logic = Get.put(CreateNewNoteLogic());
  final state = Get.find<CreateNewNoteLogic>().state;

   CreateNewNotePage({super.key, this.title="", this.note=""});

  @override
  Widget build(BuildContext context) {
    logic.note.text=note!;
    logic.title.text=title!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,actions: [ Obx(() {
            return ElevatedButton(
                onPressed: () {
                  logic.createNewNote();
                },
                child: logic.processing.value == true
                    ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                    : Text("submit note"));
          })],
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
                TextFormField(controller: logic.title,
                  style: TextStyle(color: Colors.black),

                  // controller: password,
                  // expands: true,
                  maxLines: 2,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Title"),
                ),

                Divider(thickness: 5,),
                Expanded(flex: 6,
                  child: TextFormField(controller:logic. note,
                    style: TextStyle(color: Colors.black),

                    // controller: password,
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Note"),
                  ),
                ),

              ]),
            ),
          )
        ],
      ),
    );
  }
}
