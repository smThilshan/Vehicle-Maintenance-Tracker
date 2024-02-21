import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/widgets/vehicle_card_widget.dart';

class VehicleScreen extends StatelessWidget {
  static const routeName = 'vehicle_screen';

  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My vehicles"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          VehicleCard(
            // bottomRightIcon: Icons.warning_amber_rounded,
            topRightIcon: Icons.warning_amber_rounded,
          )
          // Add more VehicleCard widgets here if needed,
        ],
      ),
    );
  }
}
