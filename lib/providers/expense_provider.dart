import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/models/expense_model.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = []; // List to store vehicles

  // Method to add a new expense
  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners(); // Notify listeners about the change
  }
}
