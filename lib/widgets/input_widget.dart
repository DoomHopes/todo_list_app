import 'package:flutter/material.dart';

Widget input(Icon icon, String hint,
    TextEditingController textEditingController, bool obscure) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: textEditingController,
      obscureText: obscure,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white30,
        ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54, width: 1),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: IconTheme(
            data: IconThemeData(color: Colors.white),
            child: icon,
          ),
        ),
      ),
    ),
  );
}
