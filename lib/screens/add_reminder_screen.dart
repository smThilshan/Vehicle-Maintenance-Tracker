import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:vehicle_maintenance_tracker/models/reminder_model.dart';
import 'package:vehicle_maintenance_tracker/services/database.dart';

import '../providers/reminder_provider.dart';

class AddReminderScreen extends StatefulWidget {
  static const routeName = 'add_reminder_screen';

  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Reminder'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 20.0),
              InkWell(
                onTap: () => _selectDateTime(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date & Time',
                    hintText: 'Select Date & Time',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMM d, y - HH:mm')
                            .format(_selectedDateTime),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String Id;
                    final newReminder = Reminder(
                      id: Id = randomAlpha(10),
                      title: _title,
                      description: _description,
                      dateTime: _selectedDateTime,
                    );

                    // Reminder.reminders.add(newReminder);
                    // Save the new reminder to your storage solution
                    // Provider.of<ReminderProvider>(context, listen: false)
                    //     .addReminder(newReminder);
                    // Navigator.pop(context);

                    // Call a method to save the reminder to Firestore
                    // String reminderId = randomAlpha(10);
                    await DatabaseMethods()
                        .addReminderDetails(newReminder.toMap(), Id);
                    Navigator.pop(context);
                  }
                },
                child: Text('Save Reminder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
