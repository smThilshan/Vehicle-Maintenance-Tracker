class Reminder {
  late String id;
  late String title;
  late String description;
  late DateTime dateTime;

  Reminder(
      {required this.id,
      required this.title,
      required this.description,
      required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
    };
  }
}
