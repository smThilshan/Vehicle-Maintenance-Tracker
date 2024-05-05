import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/models/reminder_model.dart';

class ReminderProvider with ChangeNotifier {
  List<Reminder> _reminders = []; // List to store vehicles

  // Getter for reminders
  List<Reminder> get reminders => _reminders;

  // Method to add a new expense
  void addReminder(Reminder reminder) {
    _reminders.add(reminder);
    notifyListeners(); // Notify listeners about the change
  }
}
