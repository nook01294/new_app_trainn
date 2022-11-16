import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_app/model/product.dart';

class ApiService {
  static Future<Product> getProduct() async {
    var dio = Dio();
    final servicesRes = await dio.post(
        'http://49.0.80.15:6564/baiwa-system-api-NayZaApi/api/product-NayZa/get-list-data-all',
        data: json.encode({
          "name": "",
          "type": "",
          "taste": "",
          "amount": 0,
          "money": 0,
          "id": 0
        }));
    log(servicesRes.toString());

    return Product.fromJson(servicesRes.data);
    // var response = {
    //   "status": "SUCCESS",
    //   "message": "แสดงข้อมูลสำเร็จ",
    //   "data": [
    //     {
    //       "id": 33,
    //       "name": "NayZa",
    //       "money": 123,
    //       "type": "002",
    //       "amount": 123,
    //       "taste": "ต้มเเซ่บ",
    //       "createDate": null,
    //       "updateBy": null,
    //       "updateDate": null,
    //       "createBy": null
    //     },
    //     {
    //       "id": 59,
    //       "name": "ไวไว",
    //       "money": 32,
    //       "type": "001",
    //       "amount": 43,
    //       "taste": "ต้มยำกุ้ง",
    //       "createDate": null,
    //       "updateBy": null,
    //       "updateDate": null,
    //       "createBy": null
    //     },
    //     {
    //       "id": 60,
    //       "name": "",
    //       "money": 0,
    //       "type": "",
    //       "amount": 0,
    //       "taste": "",
    //       "createDate": null,
    //       "updateBy": null,
    //       "updateDate": null,
    //       "createBy": null
    //     }
    //   ]
    // };
    // return Product.fromJson(response);
  }
}
