import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  // final String imageUrl;
  final IconData topRightIcon;

  const VehicleCard({
    Key? key,
    // required this.imageUrl,
    required this.topRightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    "NA 2582",
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
                Icon(topRightIcon, size: 35),
                SizedBox(height: 15),
                // Icon(bottomRightIcon, size: 45),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rectangle shape
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                  child: const Text("View"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
