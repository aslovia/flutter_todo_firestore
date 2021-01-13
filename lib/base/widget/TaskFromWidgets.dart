import 'package:flutter/material.dart';
import 'package:flutter_todo_firestore/base/widget/BaseWidgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskFormWidgets {
  Widget displayTaskForm(BuildContext context, String form, double widthScreen,
      double heightScreen) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(form == "add" ? 'Create\nNew Task' : 'Edit\nTask',
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget displayFormList(BuildContext context, TextEditingController nameCont,
      TextEditingController descCont, TextEditingController dateCont) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16),
            BaseWidgets()
                .displayTemplateForm(context, nameCont, "Activity", null),
            SizedBox(height: 16),
            BaseWidgets().displayTemplateForm(
                context, descCont, "Description", Icons.description),
            SizedBox(height: 16),
            BaseWidgets().displayTemplateForm(
                context, dateCont, "Date", Icons.date_range_outlined),
          ],
        ),
      ),
    );
  }

  Widget displayButton(BuildContext context, String formType, Function send) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RaisedButton(
        onPressed: send,
        color: Colors.blueGrey,
        child: Text(formType == "add" ? "Create" : "Update",
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.white)),
      ),
    );
  }
}
