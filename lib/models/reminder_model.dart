class Reminder {
  final String title;
  final String description;
  final DateTime dateTime;

  Reminder({
    required this.title,
    required this.description,
    required this.dateTime,
  });

  static List<Reminder> reminders = [
    Reminder(
        title: 'Service',
        dateTime: DateTime.now(),
        description: 'full service'),
  ];
}
