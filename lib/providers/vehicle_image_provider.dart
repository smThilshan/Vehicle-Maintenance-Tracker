import 'package:flutter/material.dart';

class VehicleImageProvider extends ChangeNotifier {
  late String _imgUrl = '';

  String getImage() => _imgUrl;

  void setImage(String imgUrl) {
    _imgUrl = imgUrl;
    notifyListeners();
  }
}
