import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/date_picker_timeline.dart';

class ScheduleBody extends StatefulWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  State<ScheduleBody> createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends State<ScheduleBody> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Divider(
          color: Colors.grey.withOpacity(0.2),
          thickness: 3,
        ),
        DatePicker(
          DateTime.now(),
          height: size.height * 0.13,
          width: size.width * 0.12,
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.green,
          selectedTextColor: Colors.white,
          dayTextStyle: const TextStyle(fontSize: 10, color: Colors.grey),
          dateTextStyle: const TextStyle(fontSize: 20, color: Colors.grey),
          onDateChange: (date) {
            _selectedDate = date;
          },
          //monthTextStyle: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.2),
          thickness: 3,
        ),
      ],
    );
  }
}
