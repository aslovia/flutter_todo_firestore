import 'package:flutter/material.dart';
import 'package:flutter_todo_firestore/base/widget/BaseWidgets.dart';
import 'package:flutter_todo_firestore/module/task_form/TaskFromWidgets.dart';

import '../../main.dart';

class TaskForm extends StatefulWidget {
  final String form;

  TaskForm({this.form});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController descCont = TextEditingController();
  final TextEditingController dateCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: baseColor,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BaseWidgets().displayBackground(context),
            TaskFormWidgets().displayTaskForm(context, widget.form)
          ],
        ),
      ),
    );
  }
}
