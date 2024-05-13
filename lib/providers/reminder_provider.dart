import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/models/reminder_model.dart';

class ReminderProvider extends ChangeNotifier {
  List<Reminder> _reminders = [];

  List<Reminder> get reminders => _reminders;

  // Method to fetch reminders from Firestore
  Future<void> fetchReminders() async {
    try {
      // Query Firestore to get all documents from the "Reminders" collection
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("Reminders").get();

      // Map each document snapshot to a Reminder object
      _reminders = querySnapshot.docs.map((doc) {
        DateTime dateTime = DateTime.parse(doc['dateTime']);
        return Reminder(
          id: doc.id,
          title: doc['title'],
          dateTime: dateTime,
          description:
              doc['description'], // Convert Firestore Timestamp to DateTime
          // Add other fields as needed
        );
      }).toList();

      notifyListeners();
    } catch (e) {
      // Handle errors, such as logging the error or showing a toast to the user
      print("Error fetching reminders: $e");
    }
  }

  Future<void> deleteReminder(String id) async {
    try {
      await FirebaseFirestore.instance.collection("Reminders").doc(id).delete();
      _reminders.removeWhere((reminder) => reminder.id == id);
      notifyListeners();
    } catch (e) {
      print("Error deleting reminder: $e");
    }
  }
}
