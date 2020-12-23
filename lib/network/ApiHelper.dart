import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_firestore/model/Task.dart';

class ApiHelper {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Task>> getTaskList() {
    var result = db.collection('task').snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Task.fromMap(doc.data(), doc.documentID),
              )
              .toList(),
        );
    return result;
  }
}
