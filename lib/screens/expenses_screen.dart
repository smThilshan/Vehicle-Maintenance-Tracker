import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_maintenance_tracker/models/expense_model.dart';
import 'package:vehicle_maintenance_tracker/providers/expense_provider.dart';

class ExpensesScreen extends StatefulWidget {
  static const routeName = 'expenses_screen';

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    final List<Expense> expenses = Expense.expenses;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Expenses = Rs 120,000.00',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  expenses.length, // Replace with your actual list of expenses
              itemBuilder: (BuildContext context, int index) {
                final expense = expenses[index];
                return ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: Text('Amount: \$${expense.amount.toStringAsFixed(2)}'),
                  subtitle: Text(expense.name), // Example amount
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      // Handle tapping on an expense item
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
