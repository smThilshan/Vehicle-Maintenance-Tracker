import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_details_screen.dart';

class VehicleCard extends StatelessWidget {
  // final String? imageUrl;
  final File? imageFile;
  final IconData topRightIcon;
  final String vehicleNo;

  const VehicleCard({
    Key? key,
    required this.vehicleNo,
    required this.topRightIcon,
    this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Card(
        margin: EdgeInsets.all(0),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: imageFile != null
                      ? DecorationImage(
                          image: FileImage(imageFile!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      vehicleNo,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(topRightIcon, size: 32),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        VehicleDetailsScreen.routeName,
                        arguments: vehicleNo,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                    ),
                    child: const Text("View"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
