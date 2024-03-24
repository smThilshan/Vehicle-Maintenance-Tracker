import 'package:flutter/material.dart';

import '../models/vehicle_model.dart';

class VehiclesProvider with ChangeNotifier {
  List<Vehicle> _vehicles = []; // List to store vehicles

  // Method to add a new vehicle
  void addVehicle(Vehicle vehicle) {
    _vehicles.add(vehicle);
    notifyListeners(); // Notify listeners about the change
  }

  // Method to remove a vehicle
  void removeVehicle(Vehicle vehicle) {
    _vehicles.remove(vehicle);
    notifyListeners(); // Notify listeners about the change
  }
}
