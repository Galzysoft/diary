import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class NotesPage extends StatelessWidget {
  final logic = Get.put(NotesLogic());
  final state = Get.find<NotesLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 150,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
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
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      // controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Search all notes",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepOrange, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fillColor: Colors.black54,
                          filled: true),
                    ),
                  ]),
            ),
            leadingWidth: 300,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 100,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrange.shade900,
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Expanded(
                            child: Row(
                          children: [
                            Text(
                              "allnote",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "time",
                                  style:
                                  TextStyle(fontSize: 20,fontStyle: FontStyle.italic, color: Colors.white.withOpacity(0.9)),
                                ),
                              ],
                            )),
                        Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "cartegory",
                                  style:
                                  TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)),
                                ),
                              ],
                            ))
                      ]),
                    ),
                  )),
            ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    );
  }
}
