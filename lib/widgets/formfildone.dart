import 'package:flutter/material.dart';

class FormFieldOne extends StatefulWidget {
  String hintText;
  String textContoler='';
  FormFieldOne({super.key, required this.hintText,required  this.textContoler});

  @override
  State<FormFieldOne> createState() => _FormFieldOneState();
}

class _FormFieldOneState extends State<FormFieldOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.white,
      child: TextFormField(
        // controller: widget.textContoler,
        onChanged: (value) {
         setState(() {
            widget.textContoler =value;
         });
        },
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(width: 2)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(width: 2)),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
