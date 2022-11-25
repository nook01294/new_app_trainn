import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_app/model/product.dart';

class ApiService {
  static Future<Product> getProduct() async {
    Product response = Product.fromJson({});
    try {
      final servicesRes = await Dio().post(
          'http://49.0.80.15:6564/baiwa-system-api-NayZaApi/api/product-NayZa/get-list-data-all',
          data: json.encode({
            "name": "",
            "type": "",
            "taste": "",
            "amount": 0,
            "money": 0,
            "id": 0
          }));
      print(servicesRes);
      if (servicesRes.statusCode == 200) {
        if (servicesRes.data['status'] == "SUCCESS") {
          response = Product.fromJson(servicesRes.data);
          return response;
        }
      }
      return response;
    } catch (e) {
      throw Exception('Failed to load service');
    }
  }

  static Future<bool> saveProduct(Data value) async {
    try {
      final servicesRes = await Dio().post(
          'http://49.0.80.15:6564/baiwa-system-api-NayZaApi/api/product-NayZa/save',
          data: json.encode({
            "name": value.name,
            "money": value.money,
            "type": value.type,
            "taste": value.taste,
            "amount": value.amount,
            "id": 0
          }));
      print(servicesRes);
      if (servicesRes.statusCode == 200) {
        if (servicesRes.data['status'] == "SUCCESS") {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception('Failed to load service');
    }
  }
  
}
