class Expense {
  final String id;
  final String name;
  final double amount;

  Expense({required this.id, required this.name, required this.amount});

  factory Expense.fromFirestore(Map<String, dynamic> data, String id) {
    double amount;
    if (data['Amount'] is String) {
      amount = double.tryParse(data['Amount']) ?? 0.0;
    } else if (data['Amount'] is num) {
      amount = (data['Amount'] as num).toDouble();
    } else {
      amount = 0.0;
    }

    return Expense(
      id: id,
      name: data['Name'] ?? 'Unnamed expense',
      amount: amount,
    );
  }
}
