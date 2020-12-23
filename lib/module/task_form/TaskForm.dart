import 'package:flutter/material.dart';
import 'package:flutter_todo_firestore/base/widget/BaseWidgets.dart';
import 'file:///D:/AndroidStudioProjects/explore/lib/base/widget/TaskFromWidgets.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskFormWidgets().displayTaskForm(
                    context, widget.form, widthScreen, heightScreen),
                SizedBox(height: 80.0),
                TaskFormWidgets().displayFormList(
                    context, nameCont, descCont, dateCont)
              ],
            )
          ],
        ),
      ),
    );
  }
}
