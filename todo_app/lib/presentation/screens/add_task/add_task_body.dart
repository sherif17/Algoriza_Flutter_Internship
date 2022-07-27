import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/core/widgets/input_field.dart';
import 'package:todo_app/data/models/task_model.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({Key? key}) : super(key: key);

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  TextEditingController _textEditingController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString(); //"09:00 Am";
  String _endTime = "08:00 PM";
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];

  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weakly", "Monthly"];

  int selectedColor = 0;
  late Database database;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //var x=
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          MyInputField(
            title: 'Title',
            hint: "Enter your task title here",
            controller: _textEditingController,
          ),
          MyInputField(
            title: 'Deadline',
            hint:
                "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}",
            widget: IconButton(
                onPressed: () {
                  _getDateFromUser(context);
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                  size: 40,
                )),
          ),
          Row(
            children: [
              Expanded(
                  child: MyInputField(
                title: 'Start Date',
                hint: _startTime,
                widget: IconButton(
                    onPressed: () {
                      _getTimeFromUser(isStartTime: true);
                    },
                    icon: const Icon(Icons.access_time)),
              )),
              const SizedBox(width: 15),
              Expanded(
                child: MyInputField(
                  title: 'End Time',
                  hint: _endTime,
                  widget: IconButton(
                    onPressed: () {
                      _getTimeFromUser(isStartTime: false);
                    },
                    icon: const Icon(Icons.access_time),
                  ),
                ),
              ),
            ],
          ),
          MyInputField(
              title: "Remind",
              hint: "$_selectedRemind minutes early",
              widget: DropdownButton(
                underline: Container(
                  height: 0,
                ),
                items: remindList.map<DropdownMenuItem<String>>((int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRemind = int.parse(value!);
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
              )),
          MyInputField(
            title: "Repeat",
            hint: "$_selectedRepeat",
            widget: DropdownButton(
                underline: Container(
                  height: 0,
                ),
                items: repeatList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRepeat = value!;
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                  size: 40,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text(
                  "Color",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Wrap(
                  children: List<Widget>.generate(3, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          radius: selectedColor == index ? 13 : 12,
                          backgroundColor: index == 0
                              ? Colors.indigo
                              : index == 1
                                  ? Colors.orange
                                  : Colors.blueAccent,
                          child: selectedColor == index
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 16,
                                )
                              : Container(),
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
          Container(
            width: size.width * 0.9,
            height: size.height * 0.07,
            child: TextButton(
              onPressed: () {
                _validateData();
                insertToDatabase(
                  title: _textEditingController.text,
                  deadline: _selectedDate.toString(),
                  color: '',
                  startTime: _startTime,
                  remind: _selectedRemind.toString(),
                  favorite: '0',
                  endTime: _endTime,
                );
              },
              child: const Text("Create Task"),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green.shade500,
                  textStyle:
                      const TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Future insertToDatabase({
    required String title,
    required String deadline,
    required String startTime,
    required String endTime,
    required String remind,
    required String favorite,
    required String color,
  }) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO todo($title, $deadline, $startTime, $endTime, $remind, $favorite, $color, status) VALUES("Todo_1", "2021-02-23", "11:00 AM", "14:00AM", ${10}, ${false}, "#FFFFFF", "Completed")')
          .then((value) => print("${value}inserted successfully"))
          .catchError((error) {
            print('Error when Inserting into Table${error.toString()}');
            return null;
          })
          .then((value) => null)
          .onError((error, stackTrace) => null);
    });
  }

  _addTaskToDB() {
    task:
    Task(
        id: 1,
        title: _textEditingController.text,
        isCompleted: 0,
        date: _selectedDate.toString(),
        startTime: _startTime,
        endTime: _endTime,
        color: selectedColor.toString(),
        remind: _selectedRemind.toString(),
        repeat: _selectedRepeat);
  }

  _validateData() {
    if (_textEditingController.text.isNotEmpty) {
      // addto  database

    } else {
      const SnackBar(content: Text("Field is required"));
    }
  }

  _getDateFromUser(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2122));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time Cancelled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(
              _startTime.split(":")[1].split(" ")[0],
            )));
  }
}
