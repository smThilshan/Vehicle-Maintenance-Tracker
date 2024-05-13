import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
// import 'package:vehicle_maintenance_tracker/models/appointment_model.dart'; // Import your appointment model
import 'package:vehicle_maintenance_tracker/models/appointments_model.dart';
import 'package:vehicle_maintenance_tracker/services/database.dart'; // Import your database service

class AddAppointmentScreen extends StatefulWidget {
  static const routeName = 'add_appointment_screen';

  @override
  _AddAppointmentScreenState createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now()
          .add(Duration(days: 365)), // Allow appointments for the next year
    );

    if (pickedDateTime != null) {
      setState(() {
        _selectedDateTime = pickedDateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appointment'),
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
              SizedBox(height: 20),
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
              SizedBox(height: 25),
              InkWell(
                onTap: () => _selectDateTime(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date and Time',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_selectedDateTime.day}/${_selectedDateTime.month}/${_selectedDateTime.year} ${_selectedDateTime.hour}:${_selectedDateTime.minute}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Create a new appointment object
                    final newAppointment = Appointment(
                      title: _title,
                      dateTime: _selectedDateTime,
                      description: _description,
                      icon: Icons.air_sharp,
                    );

                    // Add the appointment to the database
                    String appointmentId = randomAlpha(10);
                    await DatabaseMethods().addAppointmenrDetails(
                        newAppointment.toMap(), appointmentId);

                    // Navigate back to the previous screen
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
