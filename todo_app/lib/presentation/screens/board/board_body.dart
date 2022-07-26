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

  void insertToDatabase() {
    database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO todo(title, deadline, startTime, endTime, remind, favorite, color, status) VALUES("Todo_1", "2021-02-23", "11:00 AM", "14:00AM", ${10}, ${false}, "#FFFFFF", "Completed")')
          .then((value) => print("${value}inserted successfully"))
          .catchError((error) {
            print('Error when Inserting into Table${error.toString()}');
            return null;
          })
          .then((value) => null)
          .onError((error, stackTrace) => null);
    });
  }
}
