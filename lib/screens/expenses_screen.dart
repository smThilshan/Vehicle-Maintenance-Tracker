import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  static const routeName = 'expenses_screen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Expenses = Rs 120,000.00',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10, // Replace with your actual list of expenses
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text('Expense Item ${index + 1}'),
                  subtitle: Text('Amount: \$100'), // Example amount
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward),
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
