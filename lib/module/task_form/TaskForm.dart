import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_firestore/base/widget/BaseWidgets.dart';
import 'package:flutter_todo_firestore/base/widget/TaskFromWidgets.dart';
import 'package:flutter_todo_firestore/main.dart';
import 'package:flutter_todo_firestore/model/Task.dart';
import 'package:flutter_todo_firestore/network/ApiHelper.dart';

class TaskForm extends StatefulWidget {
  final String form;

  TaskForm({this.form});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  ApiHelper apiHelper = new ApiHelper();
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController descCont = TextEditingController();
  final TextEditingController dateCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldState,
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TaskFormWidgets().displayFormList(
                            context, nameCont, descCont, dateCont),
                        TaskFormWidgets()
                            .displayButton(context, widget.form, send)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void send() async {
    if (nameCont.text.isEmpty) {
      BaseWidgets().showSnackBarMessage(context, "Name is Required");
    } else if (descCont.text.isEmpty) {
      BaseWidgets().showSnackBarMessage(context, "Description is Required");
    }

    if (widget.form == "add") {
      Task task = Task(
          name: nameCont.text,
          date: Timestamp.fromDate(DateTime.now()),
          desc: descCont.text);

      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        BaseWidgets().showSnackBarMessage(context, "No Connection");
      } else {
        apiHelper.addTask(task).then((value) {
          Navigator.pop(context);
        }).catchError((e) {
          print(e);
          BaseWidgets().showSnackBarMessage(context, "Error Server");
        });
      }
    }
  }
}
