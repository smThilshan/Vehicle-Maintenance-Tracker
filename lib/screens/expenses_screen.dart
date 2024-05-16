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
  void initState() {
    super.initState();
    Provider.of<ExpenseProvider>(context, listen: false).fetchExpenses();
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final List<Expense> expenses = expenseProvider.expenses;

    double totalExpenses = expenses.fold(0, (sum, item) => sum + item.amount);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Expenses = Rs ${totalExpenses.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: expenses.length,
              itemBuilder: (BuildContext context, int index) {
                final expense = expenses[index];
                return ListTile(
                  leading: const Icon(Icons.attach_money),
                  title:
                      Text('Amount: Rs ${expense.amount.toStringAsFixed(2)}'),
                  subtitle: Text(expense.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      expenseProvider.deleteExpense(expense.id);
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
