import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:vehicle_maintenance_tracker/models/reminder_model.dart';
import 'package:vehicle_maintenance_tracker/models/vehicle_model.dart';

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

  Future<void> addAppointmenrDetails(
      Map<String, dynamic> appointmentInfoMap, String id) async {
    try {
      appointmentInfoMap["Date"] = appointmentInfoMap["dateTime"];
      await FirebaseFirestore.instance
          .collection("Appointments")
          .doc(id)
          .set(appointmentInfoMap);
    } catch (e) {
      // Handle errors here, such as logging the error or showing a toast to the user
      print("Error adding appointment details: $e");
    }
  }

  Future<List<Reminder>> getAllReminders() async {
    try {
      // Query Firestore to get all documents from the "Reminders" collection
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("Reminders").get();

      // Map each document snapshot to a Reminder object
      List<Reminder> reminders = querySnapshot.docs.map((doc) {
        Timestamp timestamp = doc['dateTime']; // Get the Firestore Timestamp
        DateTime dateTime = timestamp.toDate(); // Convert to DateTime

        return Reminder(
          id: doc.id,
          title: doc['title'],
          dateTime: dateTime,
          description:
              doc['description'], // Convert Firestore Timestamp to DateTime
          // Add other fields as needed
        );
      }).toList();

      return reminders;
    } catch (e) {
      // Handle errors, such as logging the error or showing a toast to the user
      print("Error getting reminders: $e");
      return [];
    }
  }

  // Future<List<Vehicle>> getAllVehicles() async {
  //   try {
  //     QuerySnapshot querySnapshot =
  //         await FirebaseFirestore.instance.collection("Vehicles").get();

  //     List<Vehicle> vehicles = [];

  //     for (QueryDocumentSnapshot doc in querySnapshot.docs) {
  //       // Get image URL from Firestore document
  //       String imgUrl = doc['imgUrl'];

  //       // Convert Firestore data to Vehicle object
  //       Vehicle vehicle = Vehicle(
  //           vehicleNo: doc['vehicleNo'],
  //           vehicleModel: doc['vehicleModel'],
  //           vehicleType: doc['vehicleType'],
  //           yearofRegister: doc['yearofRegister'],
  //           currentMeterReading: doc['currentMeterReading'],
  //           fuelType: doc['fuelType'],
  //           insurancePeriod: doc['insurancePeriod'],
  //           lastOilChangedDate: doc['lastOilChangedDate'],
  //           lastServicedDate: doc['lastServicedDate'],
  //           oilChangingPeriod: doc['oilChangingPeriod'],
  //           taxPeriod: doc['taxPeriod'],
  //           yearofManufacturer: doc['yearofManufacturer'],
  //           imgUrl: imgUrl, // Assign image URL to the imgUrl field
  //           imageFile: null);

  //       vehicles.add(vehicle);
  //     }

  //     return vehicles;
  //   } catch (e) {
  //     print("Error getting vehicles: $e");
  //     return [];
  //   }
  // }

  Future<List<Vehicle>> getAllVehicles() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("Vehicles").get();

      List<Vehicle> vehicles = [];

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        // Get image URL from Firestore Storage using document ID
        String imgUrl = await getImageUrl(doc.id);

        // Convert Firestore data to Vehicle object
        Vehicle vehicle = Vehicle(
          id: doc.id, // Assign the document ID to the vehicle object
          vehicleNo: doc['vehicleNo'],
          vehicleModel: doc['vehicleModel'],
          vehicleType: doc['vehicleType'],
          yearofManufacturer: doc['yearofManufacturer'],
          yearofRegister: doc['yearofRegister'],
          fuelType: doc['fuelType'],
          oilChangingPeriod: doc['oilChangingPeriod'],
          lastOilChangedDate: doc['lastOilChangedDate'],
          lastServicedDate: doc['lastServicedDate'],
          insurancePeriod: doc['insurancePeriod'],
          taxPeriod: doc['taxPeriod'],
          currentMeterReading: doc['currentMeterReading'],
          imgUrl: imgUrl,
          imageFile: null,
        );

        vehicles.add(vehicle);
      }

      return vehicles;
    } catch (e) {
      print("Error getting vehicles: $e");
      return [];
    }
  }

  Future<String> getImageUrl(String documentId) async {
    try {
      // Fetch image URL from Firebase Storage using document ID
      String imgUrl = await FirebaseStorage.instance
          .ref()
          .child('vehicle_images')
          .child('$documentId.jpg')
          .getDownloadURL();

      return imgUrl;
    } catch (e) {
      print("Error getting image URL: $e");
      return '';
    }
  }
}
