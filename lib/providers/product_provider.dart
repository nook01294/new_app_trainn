import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';

class ProductProvider with ChangeNotifier {
  Data _product = Data();
  Data get getProductt => _product;

  setProduct(Data item) {
    _product = item;
    notifyListeners();
  }

  clearProduct() {
    _product = Data();
    notifyListeners();
  }
}
