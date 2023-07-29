import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Color colorBorder;
  final Color colorLabel;
  final Color colorFill;
  final TextInputType keyboardType;
  const CustomTextField({
    super.key,
    required this.text,
    required this.colorBorder,
    required this.colorLabel,
    required this.colorFill,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(
              color: colorBorder,
            ),
          ),
          labelText: text,
          labelStyle: TextStyle(
            color: colorLabel,
          ),
          fillColor: colorFill,
          filled: true,
        ),
      ),
    );
  }
}
