import 'package:flutter/material.dart';

class CustomizedTextBox extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final bool isPassword;
  final String? iconName;
  final String? iconType;
  final String? imagepath;
  final String? suffixTextData;
  final IconData? siffixIconName;
  final Color? siffixIconColor;
  final bool readonly;
  final Function? onclick;
  final Function? iconFunction;


  const CustomizedTextBox(
      {required this.controller,
      required this.labelText,
      required this.isPassword,
      this.hintText,
      this.iconName,
      this.iconType,
      this.imagepath,
      this.suffixTextData,
      this.siffixIconName,
      this.siffixIconColor,
      this.iconFunction,
      required this.onclick,
      required this.readonly,
      Key? key})
      : super(key: key);

  @override
  State<CustomizedTextBox> createState() => _CustomizedTextBoxState();
}

class _CustomizedTextBoxState extends State<CustomizedTextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        readOnly: widget.readonly,
        obscureText: widget.isPassword,
        controller: widget.controller,
        onTap: () {
          if (widget.onclick != null) {
            widget.onclick!();
          }
        },
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          height: 0.8,
          color: Colors.black,
        ),

        decoration: InputDecoration(
          suffixText: widget.suffixTextData,

          suffixIcon: IconButton(
            icon: Icon(
              widget.siffixIconName,
              size: 25,
              color: widget.siffixIconColor,
            ),
            onPressed: () {
              if (widget.iconFunction != null) {
                widget.iconFunction!();
              }
            },
          ),
          filled: true,
          labelStyle: const TextStyle(color: Colors.blue),
          fillColor: Colors.white,
          // labelText: Translate.getT("ITEM NAME"),
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue.shade400),
          ),
        ),
      ),
    );
  }
}
