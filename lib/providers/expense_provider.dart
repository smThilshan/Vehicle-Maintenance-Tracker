import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/models/expense_model.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  Future<void> fetchExpenses() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Expenses').get();
      _expenses = querySnapshot.docs.map((doc) {
        print(
            "Document data: ${doc.data()}"); // Debug statement to print document data
        return Expense.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching expenses: $e");
    }
  }

  Future<void> deleteExpense(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Expenses').doc(id).delete();
      _expenses.removeWhere((expense) => expense.id == id);
      notifyListeners();
    } catch (e) {
      print("Error deleting expense: $e");
    }
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }
}
