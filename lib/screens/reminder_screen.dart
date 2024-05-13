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
  void initState() {
    Provider.of<ReminderProvider>(context, listen: false).fetchReminders();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final reminderProvider = Provider.of<ReminderProvider>(context);
    // final List<Reminder> reminders = reminderProvider.reminders;

    final reminderProvider = Provider.of<ReminderProvider>(context);
    // reminderProvider.fetchReminders();
    final List<Reminder> reminders = reminderProvider.reminders;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (reminders.isEmpty)
              const Center(
                child: Text("No reminders found"),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reminders.length,
                itemBuilder: (BuildContext context, int index) {
                  final reminder = reminders[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.alarm),
                    ),
                    title: Text(reminder.title),
                    subtitle: Text(reminder.dateTime.toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        reminderProvider.deleteReminder(reminder.id);
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
