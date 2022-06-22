import 'package:flutter/material.dart';

class ConstantUtils{
  static InputDecoration styleInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      counterText: "",
      labelStyle: styleTextStyleTextField(),
      errorStyle: styleTextStyleErrorTextField(),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFFB451), width: 2),
      ), //  border: const OutlineInputBorder(),
    );
  }

  static TextStyle styleTextStyleTextField() {
    return const TextStyle(
        fontSize: 20,
        color: Color(0xFF262261),
        fontFamily: "Comfortaa-Regular");
  }

  static TextStyle styleTextStyleErrorTextField() {
    return const TextStyle(
        fontSize: 17,
        color: Color(0xFFFF0016),
        fontFamily: "Comfortaa-Regular");
  }

  static TextStyle styleTextStylePasswordTextField() {
    return const TextStyle(
        fontSize: 12,
        color: Color(0xFF262261),
        fontFamily: "Comfortaa-Regular");
  }
}