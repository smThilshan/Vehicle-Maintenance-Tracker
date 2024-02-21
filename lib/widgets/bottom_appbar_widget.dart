import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_screen.dart';

class BottomAppbarWidget extends StatefulWidget {
  const BottomAppbarWidget({super.key});

  @override
  State<BottomAppbarWidget> createState() => _BottomAppbarWidgetState();
}

class _BottomAppbarWidgetState extends State<BottomAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 6,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
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
            padding: const EdgeInsets.only(left: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, VehicleScreen.routeName);
                // Navigator.pushNamed(context, VehicleScreen.routeName);
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.car_rental,
                    size: 30,
                  ),
                  Text("Vehicle")
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Padding(
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
          const Padding(
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
