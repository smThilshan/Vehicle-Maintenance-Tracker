import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future addExpenseDetails(
      Map<String, String> expenseInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Expenses")
        .doc(id)
        .set(expenseInfoMap);
  }
}
