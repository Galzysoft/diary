import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'state.dart';

class CreateNewNoteLogic extends GetxController {
  final CreateNewNoteState state = CreateNewNoteState();
  var processing = false.obs;

  Future<void> createNewNote({String? title="", String ?note=""}) async {
    processing.value=true;
    // Create a CollectionReference called notes that references the firestore collection
    final notes = FirebaseFirestore.instance.collection('notes');
// lets get the datetime stamp
    DateTime timeNow =DateTime.now();
    // Call the notes's CollectionReference to add a new user
     notes
        .add({
      'title': title, // John Doe
      'note': note, // Stokes and Sons
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
}
