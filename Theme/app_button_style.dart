import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
      backgroundColor:
          MaterialStatePropertyAll(const Color.fromARGB(255, 255, 166, 49)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 15, vertical: 8)));
}
