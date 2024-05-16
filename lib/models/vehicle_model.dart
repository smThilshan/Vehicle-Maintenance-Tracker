import 'dart:io';

import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  late String id;
  final String vehicleNo;
  final String vehicleModel;
  final String vehicleType;
  final String yearofManufacturer;
  final String yearofRegister;
  final String fuelType;
  final String oilChangingPeriod;
  final String lastOilChangedDate;
  final String lastServicedDate;
  final String insurancePeriod;
  final String taxPeriod;
  final String currentMeterReading;
  final String? imgUrl;
  final File? imageFile;

  Vehicle({
    required this.id,
    required this.vehicleNo,
    required this.vehicleModel,
    required this.vehicleType,
    required this.yearofManufacturer,
    required this.yearofRegister,
    required this.fuelType,
    required this.oilChangingPeriod,
    required this.lastOilChangedDate,
    required this.lastServicedDate,
    required this.insurancePeriod,
    required this.taxPeriod,
    required this.currentMeterReading,
    this.imgUrl,
    required this.imageFile,
  });

  @override
  List<Object?> get props => [
        id,
        vehicleNo,
        vehicleModel,
        vehicleType,
        yearofManufacturer,
        yearofRegister,
        fuelType,
        oilChangingPeriod,
        lastOilChangedDate,
        lastOilChangedDate,
        insurancePeriod,
        taxPeriod,
        currentMeterReading,
        // imgUrl,
        imageFile,
      ];

  static List<Vehicle> vehicles = [
    Vehicle(
      id: '01',
      vehicleNo: "NB 2231",
      vehicleModel: "Lanka Ashok Leyland",
      vehicleType: "Bus",
      yearofManufacturer: "2011",
      yearofRegister: "2012",
      fuelType: "Diesel",
      oilChangingPeriod: "10000 Km",
      lastOilChangedDate: "12/12/2023",
      lastServicedDate: "12/12/2023",
      insurancePeriod: "20/02/2024 - 19/02/2025",
      taxPeriod: "24/02/2024 - 23/02/2025",
      currentMeterReading: "1200000 Km",
      // imgUrl: "assets/images/bus1.jpg",
      imageFile: null,
    ),
  ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vehicleNo': vehicleNo,
      'vehicleModel': vehicleModel,
      'vehicleType': vehicleType,
      'yearofManufacturer': yearofManufacturer,
      'yearofRegister': yearofRegister,
      'fuelType': fuelType,
      'oilChangingPeriod': oilChangingPeriod,
      'lastOilChangedDate': lastOilChangedDate,
      'lastServicedDate': lastServicedDate,
      'insurancePeriod': insurancePeriod,
      'taxPeriod': taxPeriod,
      'currentMeterReading': currentMeterReading,
      // Add other fields as needed
    };
  }
}
