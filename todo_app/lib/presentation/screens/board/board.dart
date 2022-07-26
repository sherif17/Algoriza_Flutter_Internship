import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/Board/board_body.dart';
import 'package:todo_app/presentation/screens/add_task/add_task.dart';
import 'package:todo_app/presentation/screens/schedule/schedule.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: const TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 2,
              // isScrollable: true,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: [
                Tab(text: "ALL"),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Uncompltd",
                ),
                Tab(
                  text: "Favorite",
                ),
              ],
            ),
            actions: const [],
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Board",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Schedule()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: const Icon(Icons.calendar_month_rounded),
                      ),
                    ),
                  ],
                ),
                // Divider(
                //   color: Colors.grey.withOpacity(0.2),
                //   thickness: 3,
                // ),
              ],
            ),
          ),
          body: BoardBody(),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.07,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const AddTask(),
                      isScrollControlled: true,
                    );
                  },
                  child: const Text("Add Task"),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green.shade500,
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          )
          // FloatingActionButton(
          //
          //   onPressed: () {},
          //
          // ),
          ),
    );
  }
}
