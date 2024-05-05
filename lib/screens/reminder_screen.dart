import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_maintenance_tracker/models/reminder_model.dart';
import 'package:vehicle_maintenance_tracker/providers/reminder_provider.dart';
import 'package:vehicle_maintenance_tracker/screens/add_reminder_screen.dart';

class ReminderScreen extends StatefulWidget {
  static const routeName = 'reminder_screen';

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    final reminderProvider = Provider.of<ReminderProvider>(context);
    final List<Reminder> reminders = reminderProvider.reminders;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (reminders.isEmpty)
              Center(
                child: Text("No reminders found"),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: reminders.length,
                itemBuilder: (BuildContext context, int index) {
                  final reminder = reminders[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.alarm),
                    ),
                    title: Text(reminder.title),
                    subtitle: Text(reminder.dateTime.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Delete reminder logic here
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
