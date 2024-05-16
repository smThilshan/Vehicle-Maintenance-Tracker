import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/screens/live_location_screen.dart';
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
      print('Selected Vehicle: ${selectedVehicle.vehicleModel}');
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
            if (selectedVehicle != null && selectedVehicle.imageFile != null)
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: FileImage(selectedVehicle.imageFile!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 13.0),
            Center(
              child: Text(
                '${selectedVehicle?.vehicleModel} ${selectedVehicle?.yearofRegister} ',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            //  SizedBox(height: 10.0),
            Text(
              'Vehicle No: ${selectedVehicle?.vehicleNo}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Vehicle Type: ${selectedVehicle?.vehicleType}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Year of Manufacture : ${selectedVehicle?.yearofManufacturer}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Year of Register : ${selectedVehicle?.yearofRegister}  ',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Fuel Type : ${selectedVehicle?.fuelType}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Oil Changing Period: ${selectedVehicle?.oilChangingPeriod}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Last Oil Changed Date : ${selectedVehicle?.lastOilChangedDate}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Last Serviced Date : ${selectedVehicle?.lastServicedDate}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Insurance Period: ${selectedVehicle?.insurancePeriod}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 13.0),
            Text(
              'Tax Period: ${selectedVehicle?.taxPeriod}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            TileCustomCardWidget(
              textline: "Live Location",
              onTap: () {
                Navigator.pushNamed(context, LiveLocationScreen.routeName);
              },
            ),
            SizedBox(
              height: 10,
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
              textline:
                  "Total Mileages: ${selectedVehicle?.currentMeterReading}",
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
