import 'package:flutter/material.dart';

// class Appointment {
//   final IconData icon;
//   final String heading;
//   final String description;

//   Appointment({
//     required this.icon,
//     required this.heading,
//     required this.description,
//   });
// }

class Appointment {
  late String id;
  late String title;
  late String description;
  late DateTime? dateTime;
  final IconData icon;

  Appointment({
    required this.id,
    required this.title,
    required this.description,
    this.dateTime,
    required this.icon,
    // required String id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': '001',
      'title': title,
      'description': description,
      'dateTime': dateTime // Convert DateTime to string
    };
  }
}
