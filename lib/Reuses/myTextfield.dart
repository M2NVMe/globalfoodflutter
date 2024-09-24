import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final String hintText;
  final TextStyle textStyle;
  final TextStyle hintstyle;
  final bool isObscure;
  final TextInputType keytype;
  final Color fillcolor;
  final bool filled;
  final double rad;
  final Color borderColor;
  final TextEditingController controller;
  final double height;
  final double width;

  const myTextField({
    super.key,
    required this.hintText,
    required this.isObscure,
    required this.textStyle,
    required this.rad,
    required this.controller,
    required this.keytype,
    required this.fillcolor,
    required this.filled,
    required this.borderColor, required this.height, required this.width, required this.hintstyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: keytype,
        controller: controller,
        obscureText: isObscure,
        style: textStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintstyle,
          fillColor: fillcolor,
          filled: filled,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rad),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rad),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(rad),
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
