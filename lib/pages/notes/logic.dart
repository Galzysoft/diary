import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'state.dart';

class NotesLogic extends GetxController {
  final NotesState state = NotesState();
  var search = "".obs;

  final noteRefrence = FirebaseFirestore.instance.collection("notes").obs;
late final String b;

  Stream<QuerySnapshot> searchNote() async* {
    b="12";
    var _search = noteRefrence.value
        .where(
          'title',
          isGreaterThanOrEqualTo: search.value,
        )

        .snapshots();

    yield* _search;
  }
}
