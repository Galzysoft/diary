import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dairy/pages/create_new_note/logic.dart';
import 'package:my_dairy/pages/create_new_note/view.dart';

import 'logic.dart';

class NotesPage extends StatelessWidget {
  final logic = Get.put(NotesLogic());

  //here we put the controller for the  CreateNewNoteLogic in order to access  its functionalities
  final logicCreateNote = Get.put(CreateNewNoteLogic());
  final state = Get
      .find<NotesLogic>()
      .state;

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
                 onChanged: (value) {
                      logic.search.value=value;
                      },
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
          SliverFillRemaining(
            child: Obx(() {
              return StreamBuilder<QuerySnapshot>(
                  stream:logic.search.value.isEmpty? logic.noteRefrence.value.snapshots():logic.searchNote(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView(
                      children: snapshot.data!.docs.map((
                          DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<
                            String,
                            dynamic>;

                        return Dismissible(
                          background: Icon(Icons.delete, color: Colors.red,),
                          key: UniqueKey(),
                          // direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            logicCreateNote.deleteNewNote(document.id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 100,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepOrange.shade900,
                                  elevation: 6,
                                  child: InkWell(onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CreateNewNotePage(
                                                  note: data["note"],
                                                  title: data["title"]),
                                        )).then((value) =>
                                        logicCreateNote.updateNewNote(
                                            document.id));
                                  },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(children: [
                                        Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  data["title"]
                                                      .toString()
                                                      .isEmpty
                                                      ? data["note"]
                                                      : data["title"],
                                                  style:
                                                  TextStyle(fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  data["time"],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontStyle: FontStyle
                                                          .italic,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  data["cartegory"],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white
                                                          .withOpacity(0.7)),
                                                ),
                                              ],
                                            ))
                                      ]),
                                    ),
                                  ),
                                )),
                          ),
                        );
                      }).toList(),
                    );
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                            Padding(
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
                                                  TextStyle(fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "time",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontStyle: FontStyle
                                                          .italic,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "cartegory",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white
                                                          .withOpacity(0.7)),
                                                ),
                                              ],
                                            ))
                                      ]),
                                    ),
                                  )),
                            ),
                      ),);
                  }
              );
            }),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateNewNotePage(),
                )).then((value) => logicCreateNote.createNewNote());
          },
          child: Icon(Icons.add)),
    );
  }
}
