import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  const MyDatePicker(
      {required this.controller, required this.labelText, Key? key})
      : super(key: key);

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  // TextEditingController _date = TextEditingController();

  void setDateText(TextEditingController date) async {
    DateTime? pickeddate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickeddate != null) {
      setState(() {
        date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue.shade400),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/calendar-48.png',
            height: 35,
            width: 35,
          ),
        ),

        labelText: widget.labelText,
        // hintText: widget.label_text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.blue.shade400),
        ),
      ),
      style: const TextStyle(height: 0.7),
      onTap: () {
        setDateText(widget.controller);
      },
    );
  }
}
