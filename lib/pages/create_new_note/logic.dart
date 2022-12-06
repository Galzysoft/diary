import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class CreateNewNoteLogic extends GetxController {

  final CreateNewNoteState state = CreateNewNoteState();
  var processing = false.obs;
  TextEditingController title=TextEditingController();
  TextEditingController note=TextEditingController();
  Future<void> createNewNote() async {
    processing.value=true;
    // Create a CollectionReference called notes that references the firestore collection
    final notes = FirebaseFirestore.instance.collection('notes');
// lets get the datetime stamp
    DateTime timeNow =DateTime.now();
    // Call the notes's CollectionReference to add a new user
     notes
        .add({
      'title': title.text.isEmpty&&note.text.isEmpty?"Untitle Page":title.text.isEmpty? note.text:title.text, // John Doe
      'note': note.text, // Stokes and Sons
      'time': timeNow.toString() ,
        'cartegory': "my diary", // 42
    })
        .then((value) {
          print("Note Added");
                 processing.value=false;



        })

        .catchError((error) {
          print("Failed to add user: $error");
              processing.value=false;
        });

  }
  Future<void> updateNewNote(var docId) async {
    processing.value=true;
    // Create a CollectionReference called notes that references the firestore collection
    final notes = FirebaseFirestore.instance.collection('notes').doc(docId);
// lets get the datetime stamp
    DateTime timeNow =DateTime.now();
    // Call the notes's CollectionReference to add a new user
    notes.update({
      'title': title.text.isEmpty&&note.text.isEmpty?"Untitle Page":title.text.isEmpty? note.text:title.text, // John Doe
      'note': note.text, // Stokes and Sons
      'time': timeNow.toString() ,
      'cartegory': "my diary", // 42
    })
        .then((value) {
      print("Note updated");
      processing.value=false;



    })

        .catchError((error) {
      print("Failed to add user: $error");
      processing.value=false;
    });

  }
  Future<void> deleteNewNote(var docId) async {
    processing.value=true;
    // Create a CollectionReference called notes that references the firestore collection
    final notes = FirebaseFirestore.instance.collection('notes').doc(docId);
// lets get the datetime stamp
    DateTime timeNow =DateTime.now();
    // Call the notes's CollectionReference to add a new user
    notes.delete()
        .then((value) {
      print("Note deleted");
      processing.value=false;



    })

        .catchError((error) {
      print("Failed to add user: $error");
      processing.value=false;
    });

  }
}
