import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/screens/vehicle_details_screen.dart';

class VehicleCard extends StatelessWidget {
  // final String imageUrl;
  final IconData topRightIcon;
  final String VehicleNo;

  const VehicleCard({
    Key? key,
    required this.VehicleNo,
    required this.topRightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: 15), // Add margin to create gap between cards
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
                  image: DecorationImage(
                    image: AssetImage("assets/images/car1.jpg"),
                    // image: NetworkImage(
                    //     "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      VehicleNo,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ), // Add your text here
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(topRightIcon, size: 32),
                  SizedBox(height: 20),
                  // Icon(bottomRightIcon, size: 45),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        VehicleDetailsScreen.routeName,
                        arguments: VehicleNo,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rectangle shape
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
