class Reminder {
  late String title;
  late String description;
  late DateTime dateTime;

  Reminder(
      {required this.title, required this.description, required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
    };
  }
}
