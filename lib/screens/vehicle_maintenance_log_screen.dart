import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VehicleMaintenanceLogScreen extends StatefulWidget {
  static const routeName = 'log_screen';

  @override
  _VehicleMaintenanceLogScreenState createState() =>
      _VehicleMaintenanceLogScreenState();
}

class _VehicleMaintenanceLogScreenState
    extends State<VehicleMaintenanceLogScreen> {
  int _selectedViewIndex = 0; // 0 for basic view, 1 for detailed view

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Maintenance Log'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Placeholder for the pie chart
          Container(
            height: 300,
            padding: EdgeInsets.all(12),
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    titleStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    value: 30,
                    color: Colors.green,
                    // title: 'Up to Date',
                  ),
                  PieChartSectionData(
                    titleStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    value: 40,
                    color: Colors.blue,
                    // title: 'Due This Month',
                  ),
                  PieChartSectionData(
                    titleStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    value: 30,
                    color: Colors.red,
                    // title: 'Overdue',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Tap icons for selecting different views
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // buildTapIcon(0, Icons.view_list , txt: ""),
              // buildTapIcon(1, Icons.calendar_today),
              // buildTapIcon(2, Icons.history),
              buildTapIcon(
                  0, Icons.circle, "Up to date", Colors.green.shade400),
              buildTapIcon(1, Icons.circle, "Due this month", Colors.blue),
              buildTapIcon(2, Icons.circle, "Overdue", Colors.red),
            ],
          ),
          SizedBox(height: 20),
          // Details based on the selected view
          _selectedViewIndex == 0 ? BasicViewDetails() : BasicViewDetails(),
          _selectedViewIndex == 1 ? BasicViewDetails() : DetailedViewDetails(),
          _selectedViewIndex == 2 ? BasicViewDetails() : OverDueDetails(),
        ],
      ),
    );
  }

  Widget buildTapIcon(int index, IconData icon, String txt, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedViewIndex = index;
        });
      },
      child: Row(
        children: [
          Icon(
            icon,
            // color: _selectedViewIndex == index ? Colors.blue : Colors.grey,
            color: color,
            size: 30,
          ),
          Text(txt.toString())
        ],
      ),
    );
  }
}

class BasicViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic View Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('List of basic maintenance tasks'),
          // Add more details as needed
          SizedBox(height: 10),
          Text('List of Over due'),
        ],
      ),
    );
  }
}

class DetailedViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detailed View Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('List of maintenance tasks due this month or overdue'),
          // Add more details as needed
        ],
      ),
    );
  }
}

class OverDueDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Over due Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('List of maintenance tasks due this month or overdue'),
          // Add more details as needed
        ],
      ),
    );
  }
}
