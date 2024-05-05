import 'package:flutter/material.dart';
import 'package:vehicle_maintenance_tracker/models/shops_model.dart';

class ShopScreen extends StatelessWidget {
  static const routeName = 'shops_screen';
  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration
    final List<Shop> nearbyShops = [
      Shop(
        name: 'Sample Shop 1',
        address: '123 Main St',
        distance: '0.5 miles',
      ),
      Shop(
        name: 'Sample Shop 2',
        address: '456 Elm St',
        distance: '0.8 miles',
      ),
      Shop(
        name: 'Sample Shop 3',
        address: '789 Oak St',
        distance: '1.2 miles',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Shops Near Me'),
      ),
      body: ListView.builder(
        itemCount: nearbyShops.length,
        itemBuilder: (context, index) {
          final shop = nearbyShops[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.store),
              title: Text(shop.name),
              subtitle: Text(shop.address),
              trailing: Text(shop.distance),
              onTap: () {
                // Handle onTap action
              },
            ),
          );
        },
      ),
    );
  }
}
