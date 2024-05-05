class Expense {
  final String name;
  final double amount;
  final DateTime date;

  Expense({
    required this.name,
    required this.amount,
    required this.date,
  });

  static List<Expense> expenses = [
    Expense(name: 'Brake Pad', amount: 1500, date: DateTime.now()),
  ];
}
