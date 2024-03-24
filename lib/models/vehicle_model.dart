import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String name;
  final String imgUrl;
  final String vehicleNo;

  const Vehicle({
    required this.name,
    required this.imgUrl,
    required this.vehicleNo,
  });

  @override
  List<Object?> get props => [name, imgUrl, vehicleNo];

  static List<Vehicle> vehicles = [
    const Vehicle(
      name: "Toyota Prius",
      imgUrl: "assets/images/car1.jpg",
      vehicleNo: "NA 2582",
    ),
    const Vehicle(
      name: "Nissan March",
      imgUrl: "assets/images/car2.jpg",
      vehicleNo: "JU 3917",
    ),
    const Vehicle(
      name: "Suzuki Alto",
      imgUrl: "assets/images/car1.jpg",
      vehicleNo: "CAB 2000",
    ),
    const Vehicle(
      name: "Suzuki Celerio",
      imgUrl: "assets/images/celerio.jpg",
      vehicleNo: "CBA 2500",
    ),
    const Vehicle(
      name: "Ashok Leyland",
      imgUrl: "assets/images/celerio.jpg",
      vehicleNo: "NA 2582",
    ),
  ];
}
