import 'package:flutter/material.dart';

class FormFieldOne extends StatelessWidget {
  String hintText;
  FormFieldOne({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.white,
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(width: 2)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(width: 2)),
          hintText: hintText,
        ),
      ),
    );
  }
}
