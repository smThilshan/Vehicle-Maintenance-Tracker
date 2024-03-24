import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_maintenance_tracker/models/vehicle_model.dart'; // Import your Vehicle model
import 'package:vehicle_maintenance_tracker/providers/vehicles_provider.dart';
import 'package:vehicle_maintenance_tracker/widgets/vehicle_card_widget.dart';

class VehicleScreen extends StatelessWidget {
  static const routeName = 'vehicle_screen';

  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the provider to get the VehicleProvider instance
    final vehicleProvider = Provider.of<VehiclesProvider>(context);

    // Use the vehicles list from the VehicleProvider
    final List<Vehicle> vehicles = Vehicle.vehicles;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // VehicleCard(
            //   topRightIcon: Icons.warning_amber_rounded,
            //   VehicleNo: "NA 2582",
            // ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return VehicleCard(
                  topRightIcon: Icons.warning_amber_rounded,
                  VehicleNo: vehicle.vehicleNo,
                );
              },
            ),
            // Add more VehicleCard widgets here if needed,
          ],
        ),
      ),
    );
  }
}
