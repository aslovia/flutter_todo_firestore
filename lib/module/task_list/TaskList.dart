import 'package:flutter/material.dart';
import 'package:flutter_todo_firestore/main.dart';
import 'package:flutter_todo_firestore/module/task_list/ListWidgets.dart';
import 'package:flutter_todo_firestore/network/ApiHelper.dart';
class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  ApiHelper apiHelper;

  @override
  void initState() {
    super.initState();
    apiHelper = new ApiHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListWidgets().displayBackground(context),
            ListWidgets().displayListActivity(context, apiHelper)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          // TODO: fitur tambah task
        },
        backgroundColor: mainColor,
      ),
    );
  }
}
