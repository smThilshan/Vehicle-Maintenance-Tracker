import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Future<void> addExpenseDetails(
      Map<String, dynamic> expenseInfoMap, String id) async {
    try {
      expenseInfoMap["Date"] = DateTime.now();
      int amount = int.parse(expenseInfoMap["Amount"]);
      await FirebaseFirestore.instance.collection("Expenses").doc(id).set(
            expenseInfoMap,
          );
    } catch (e) {
      // Handle errors here, such as logging the error or showing a toast to the user
      print("Error adding expense details: $e");
    }
  }

  Future<void> addReminderDetails(
      Map<String, dynamic> reminderInfoMap, String id) async {
    try {
      reminderInfoMap["Date"] = reminderInfoMap["dateTime"];
      await FirebaseFirestore.instance
          .collection("Reminders")
          .doc(id)
          .set(reminderInfoMap);
    } catch (e) {
      // Handle errors here, such as logging the error or showing a toast to the user
      print("Error adding reminder details: $e");
    }
  }

  Future<void> addVehicleDetails(
      Map<String, dynamic> vehicleInfoMap, File? imageFile) async {
    try {
      // Upload the image file to Firebase Storage
      if (imageFile != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('vehicle_images')
            .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
        await storageRef.putFile(imageFile);
        final imageUrl = await storageRef.getDownloadURL();

        // Add the image URL to the vehicle info map
        vehicleInfoMap['imgUrl'] = imageUrl;
      }

      // Save the vehicle details to Firestore
      await FirebaseFirestore.instance
          .collection("Vehicles")
          .add(vehicleInfoMap);
    } catch (e) {
      print("Error adding vehicle details: $e");
    }
  }
}
