import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 9),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    cursorColor: Colors.grey,
                    controller: controller,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                ),
                widget == null ? Container() : Container(child: widget),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
