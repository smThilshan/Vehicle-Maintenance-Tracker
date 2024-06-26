import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:vehicle_maintenance_tracker/models/expense_model.dart';
import 'package:vehicle_maintenance_tracker/services/database.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class AddExpenseScreen extends StatefulWidget {
  static const routeName = 'add_expense_screen';

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController amountcontroller = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String _expenseName;
  late double _expenseAmount;
  late DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDateTime) {
      setState(() {
        _selectedDateTime = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(labelText: 'Expense Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter expense name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _expenseName = value!;
                },
              ),
              TextFormField(
                controller: amountcontroller,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _expenseAmount = double.parse(value!);
                },
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'Select date',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_selectedDateTime.day}/${_selectedDateTime.month}/${_selectedDateTime.year}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () => _selectTime(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Time',
                    hintText: 'Select time',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_selectedDateTime.hour}:${_selectedDateTime.minute}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(Icons.access_time),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  String Id = randomAlpha(10);
                  Map<String, dynamic> expenseInfoMap = {
                    "Name": namecontroller.text,
                    "Amount": amountcontroller.text,
                    "Id": Id,
                  };
                  // try {
                  await DatabaseMethods().addExpenseDetails(expenseInfoMap, Id);
                  //   Fluttertoast.showToast(
                  //       msg: "Expense added successfully",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.red,
                  //       textColor: Colors.white,
                  //       fontSize: 16.0);
                  // } catch (e) {
                  //   print("Error adding expense: $e");
                  //   Fluttertoast.showToast(
                  //       msg: "Failed to add expense. Please try again.",
                  //       toastLength: Toast.LENGTH_SHORT,
                  //       gravity: ToastGravity.CENTER,
                  //       timeInSecForIosWeb: 1,
                  //       backgroundColor: Colors.red,
                  //       textColor: Colors.white,
                  //       fontSize: 16.0);
                  // }

                  // *** These are for provider //***

                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();

                  //   final newExpense = Expense(
                  //     name: _expenseName,
                  //     amount: _expenseAmount,
                  //     date: _selectedDateTime,
                  //   );

                  //   Expense.expenses.add(newExpense);
                  Navigator.pop(context);
                  // }
                },
                child: Text('Add Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
