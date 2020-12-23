import 'package:flutter/material.dart';
import 'package:flutter_todo_firestore/main.dart';
import 'package:flutter_todo_firestore/model/Task.dart';
import 'package:flutter_todo_firestore/network/ApiHelper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListWidgets {
  Widget displayListActivity(BuildContext context, ApiHelper apiHelper) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;
    return Container(
        width: widthScreen,
        height: heightScreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Todo List',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Expanded(
                child: StreamBuilder<List<Task>>(
                    stream: apiHelper.getTaskList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Task>> snapshot) {
                      print("ini data " + snapshot.toString());
                      if (snapshot.connectionState == ConnectionState.waiting ||
                          !snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                      if (snapshot.data.isEmpty) {
                        return Center(
                            child: Text(
                          "Tidak Ada Data Todo List",
                          style: TextStyle(color: Colors.white),
                        ));
                      }
                      return ListView.builder(
                          padding: EdgeInsets.all(3),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int i) {
                            Task task = snapshot.data[i];
                            int number = 1 + i++;
                            DateTime myDateTime = (task.date).toDate();
                            return Card(
                              child: ListTile(
                                leading: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: baseColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      number.toString(),
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  task.name,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      task.desc,
                                      style: GoogleFonts.poppins(fontSize: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      DateFormat('EEEE, dd MMMM yyyy kk:mm',
                                                  'id')
                                              .format(myDateTime) +
                                          " WIB",
                                      style: GoogleFonts.poppins(fontSize: 11),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                trailing: PopupMenuButton(
                                  itemBuilder: (BuildContext context) {
                                    return List<PopupMenuEntry<String>>()
                                      ..add(PopupMenuItem<String>(
                                        value: 'edit',
                                        child: Text('Edit'),
                                      ))
                                      ..add(PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Text('Delete'),
                                      ));
                                  },
                                  onSelected: (String value) async {
                                    if (value == 'edit') {
                                      // TODO: fitur edit task
                                    } else if (value == 'delete') {
                                      // TODO: fitur hapus task
                                    }
                                  },
                                  child: Icon(Icons.more_vert),
                                ),
                              ),
                            );
                          });
                    }))
          ],
        ));
  }
}
