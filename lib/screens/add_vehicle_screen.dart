import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:vehicle_maintenance_tracker/models/vehicle_model.dart';
import 'package:vehicle_maintenance_tracker/services/database.dart';

class AddVehicleScreen extends StatefulWidget {
  static const routeName = 'add_vehicle_screen';

  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _vehicleNo;
  late String _vehicleModel;
  late String _vehicleType;
  late String _yearofManufacturer;
  late String _yearofRegister;
  late String _fuelType;
  late String _oilChangingPeriod;
  late String _lastOilChangedDate;
  late String _lastServicedDate;
  late String _insurancePeriod;
  late String _taxPeriod;
  late String _currentMeterReading;
  late String _imgUrl = '';
  File? _imageFile;
  // Add more fields for other vehicle details

  @override
  Widget build(BuildContext context) {
//     final Map<String, dynamic> args =
//         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     final String vehicleNo = args['vehicleNo'] as String;
//     final String imgUrl = args['imgUrl'] as String; // Retrieve the image URL

// // Find the vehicle details based on the vehicle number
//     final Vehicle? selectedVehicle = Vehicle.vehicles.firstWhere(
//       (vehicle) => vehicle.vehicleNo == vehicleNo,
//       // orElse: () => ,
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vehicle'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Vehicle No'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _vehicleNo = value!;
                  },
                ),

                TextFormField(
                  decoration: const InputDecoration(labelText: 'Vehicle Model'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _vehicleModel = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Vehicle Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _vehicleType = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'YOM '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _yearofManufacturer = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'YOR'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _yearofRegister = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Fuel Type '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _fuelType = value!;
                  },
                ),

                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Oil changing period '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _oilChangingPeriod = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'last Service Date '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last Service Date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastServicedDate = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'last Oil Changed Date '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last Oil Changed Date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastOilChangedDate = value!;
                  },
                ),
                // TextFormField(
                //   decoration:
                //       const InputDecoration(labelText: 'Last service date '),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter vehicle model';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     _fuelType = value!;
                //   },
                // ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Insurance period'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _insurancePeriod = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Tax period '),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _taxPeriod = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Current Meter Reading'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter vehicle model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _currentMeterReading = value!;
                  },
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     final picker = ImagePicker();
                //     final pickedFile =
                //         await picker.pickImage(source: ImageSource.gallery);

                //     if (pickedFile != null) {
                //       setState(() {
                //         _imgUrl = pickedFile.path;
                //       });

                //       Provider.of<VehicleImageProvider>(context, listen: false)
                //           .setImage(pickedFile.path);
                //     }
                //   },
                //   child: Text('Select Image'),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      print("Image file path: ${pickedFile.path}");
                      setState(() {
                        _imageFile =
                            File(pickedFile.path); // Save the image file
                      });
                    }
                  },
                  child: const Text('Select Image'),
                ),
                const SizedBox(height: 16),

                if (_imageFile != null)
                  Image.file(
                    _imageFile!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),

                // if (_imgUrl.isNotEmpty)
                //   Image.file(
                //     File(_imgUrl),
                //     height: 100, // Adjust the height as needed
                //     width: 100, // Adjust the width as needed
                //     fit: BoxFit.cover, // Adjust the fit property as needed
                //   ),

                // Add TextFormField for other vehicle details here
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Create a new vehicle object and add it to the list
                      String Id;
                      final newVehicle = Vehicle(
                        id: Id = randomAlpha(10),
                        vehicleNo: _vehicleNo,
                        vehicleModel: _vehicleModel,
                        vehicleType: _vehicleType,
                        yearofManufacturer: _yearofManufacturer,
                        yearofRegister: _yearofRegister,
                        fuelType: _fuelType,
                        oilChangingPeriod: _oilChangingPeriod,
                        lastOilChangedDate: _lastOilChangedDate,
                        lastServicedDate: _lastServicedDate,
                        insurancePeriod: _insurancePeriod,
                        taxPeriod: _taxPeriod,
                        currentMeterReading: _currentMeterReading,
                        // imgUrl: _imgUrl,
                        imageFile: _imageFile,

                        // Assign other vehicle details here
                      );
                      // Add logic to add the new vehicle to the list or database
                      Vehicle.vehicles.add(newVehicle);

                      // This is for firebase
                      await DatabaseMethods()
                          .addVehicleDetails(newVehicle.toMap(), _imageFile);
                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Vehicle'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
