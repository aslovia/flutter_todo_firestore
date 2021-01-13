import 'package:flutter/material.dart';
import 'package:flutter_todo_firestore/base/widget/BaseWidgets.dart';
import 'package:flutter_todo_firestore/main.dart';
import 'package:flutter_todo_firestore/module/task_form/TaskForm.dart';
import 'package:flutter_todo_firestore/network/ApiHelper.dart';

import '../../base/widget/ListWidgets.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  ApiHelper apiHelper = new ApiHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BaseWidgets().displayBackground(context),
            ListWidgets().displayListActivity(context, apiHelper, delete)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => TaskForm(form: "add")));
        },
        backgroundColor: mainColor,
      ),
    );
  }

  void delete(task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print("ini id " + task.id);
        return AlertDialog(
          title: Text('Are You Sure'),
          content: Text('Do you want to delete ${task.name}?'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('Delete'),
              onPressed: () {
                apiHelper.deleteTask(task.id).then((value) => {
                  Navigator.pop(context)
                }).catchError((e){
                  BaseWidgets().showSnackBarMessage(context, "Error Server");
                });
              },
            ),
          ],
        );
      },
    );
  }
}
