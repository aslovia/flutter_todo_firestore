import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_firestore/model/Task.dart';

class ApiHelper {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<Task>> getTaskList() {
    var result = db.collection('task').orderBy('date').snapshots().map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Task.fromMap(doc.data(), doc.documentID),
              )
              .toList(),
        );
    return result;
  }

  Future addTask(Task task) async {
    var tasks = db.collection('task');
    DocumentReference  result = await tasks.add(task.toAddTask());
    return result;
  }

  Future deleteTask(String id) async {
    var tasks = db.collection('task').document(id).delete();
    return tasks;
  }


}
