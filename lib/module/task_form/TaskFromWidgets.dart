import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskFormWidgets {
  Widget displayTaskForm(BuildContext context, String form) {
    return Padding(
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
          Text(
            form == "Add" ? 'Create\nNew Task' : 'Edit\nTask',
            style: Theme.of(context).textTheme.display1.merge(
                  GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                ),
          ),
          SizedBox(height: 16.0),
          // TextField(
          //   controller: controllerName,
          //   decoration: InputDecoration(
          //     labelText: 'Name',
          //   ),
          //   style: TextStyle(fontSize: 18.0),
          // ),
        ],
      ),
    );
  }
}
