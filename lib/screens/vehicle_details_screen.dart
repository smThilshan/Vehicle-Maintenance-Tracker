import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/widgets/tile_custom_card_widget.dart';

import '../models/vehicle_model.dart';

class VehicleDetailsScreen extends StatelessWidget {
  static const routeName = 'vehicle_details_screen';

  const VehicleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the vehicle number passed from the previous screen
    final String vehicleNo =
        ModalRoute.of(context)!.settings.arguments as String;

    // Find the vehicle details based on the vehicle number
    final Vehicle? selectedVehicle = Vehicle.vehicles.firstWhere(
      (vehicle) => vehicle.vehicleNo == vehicleNo,
      // orElse: () => ,
    );

    // Handle the case where selectedVehicle could be null
    if (selectedVehicle != null) {
      // Vehicle details found, use selectedVehicle here
      // For example:
      print('Selected Vehicle: ${selectedVehicle.name}');
    } else {
      // Vehicle details not found, handle the case here
      // For example:
      print('Vehicle not found');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/car1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Vehicle No: ${selectedVehicle?.vehicleNo}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Center(
              child: Text(
                'Suzuki Celerio 2018',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.0),
            SizedBox(height: 20.0),
            Text(
              'Vehicle Type: Bus',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Year of Manufacture : 2013',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Year of Register : 2013  ',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Fuel Type : Diesel',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Oil Changing Period: 12000 km',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Last Serviced Date : 02.02.2024',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Insurance Period:  02.02.2024 - 01.02.2025',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Tax Period:  13.02.2024 - 12.02.2025',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            TileCustomCardWidget(
              textline: "Live Location",
            ),
            SizedBox(
              height: 10,
            ),
            TileCustomCardWidget(
              textline: "Total Expenses: LKR 26500.00",
            ),
            SizedBox(
              height: 10,
            ),
            TileCustomCardWidget(
              textline: "Total Mileages: 265,300 Km",
            ),
            SizedBox(
              height: 10,
            ),
            TileCustomCardWidget(
              textline: "Upcoming Services",
            ),
            SizedBox(
              height: 10,
            ),
            TileCustomCardWidget(
              textline: "Completed Services",
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
