import 'package:flutter/material.dart';

class BottomAppbarWidget extends StatefulWidget {
  const BottomAppbarWidget({super.key});

  @override
  State<BottomAppbarWidget> createState() => _BottomAppbarWidgetState();
}

class _BottomAppbarWidgetState extends State<BottomAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      notchMargin: 6,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  size: 30,
                ),
                Text("Home")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Icon(
                  Icons.money_rounded,
                  size: 30,
                ),
                Text("Expense")
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              children: [
                Icon(
                  Icons.car_rental,
                  size: 30,
                ),
                Text("Vehicle")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                ),
                Text("Settings")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
