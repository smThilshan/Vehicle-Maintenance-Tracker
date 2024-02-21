import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String name;
  final String imgUrl;

  const Vehicle({
    required this.name,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [name, imgUrl];

  static List<Vehicle> vehicles = [
    const Vehicle(
      name: "Toyota Prius",
      imgUrl: "assets/images/car1.jpg",
    ),
    const Vehicle(
      name: "Nissan March",
      imgUrl: "assets/images/car2.jpg",
    ),
    const Vehicle(
      name: "Suzuki Alto",
      imgUrl: "assets/images/car1.jpg",
    ),
  ];
}
