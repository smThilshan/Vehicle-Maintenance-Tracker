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
      imgUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    ),
    const Vehicle(
      name: "Nissan March",
      imgUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    ),
    const Vehicle(
      name: "Suzuki Alto",
      imgUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    ),
  ];
}
