import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class BoardBody extends StatefulWidget {
  BoardBody({Key? key}) : super(key: key);

  @override
  State<BoardBody> createState() => _BoardBodyState();
}

class _BoardBodyState extends State<BoardBody> {
  // List<Widget> taps = [Text("All"), Text("All"), Text("All"), Text("All")];
  late Database database;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Divider(
          //   color: Colors.grey.withOpacity(0.2),
          //   thickness: 3,
          // ),
        ],
      ),
    );
  }

  Future<void> createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (Database db, int version) {
      print('database created');
      db
          .execute(
              'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT, deadLine TEXT, startTime TEXT, endTime TEXT, remind REAL, favorite BOOL, color TEXT, status TEXT )')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('Error when Creating Table${error.toString()}');
      });
    }, onOpen: (database) {
      print('database opened');
    });
  }
}
