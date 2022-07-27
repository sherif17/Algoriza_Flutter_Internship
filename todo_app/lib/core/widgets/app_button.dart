import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Widget widget;

  AppButton({Key? key, required this.text, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
                builder: (context) => widget,
                isScrollControlled: true,
              );
            },
            child: Text(text),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green.shade500,
                textStyle: const TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
