import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String name;
  String desc;
  Timestamp date;

  Task({this.id, this.name, this.desc, this.date});

  Task.fromMap(Map snapshot, String id) :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        desc = snapshot['desc'] ?? '',
        date = snapshot['date'] ?? '';

  Map<String, dynamic> toAddTask() {
    return {
      "name" : name,
      "desc" : desc,
      "date" : date
    };
  }
}