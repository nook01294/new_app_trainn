class Product {
  String? status;
  String? message;

  List<Data>? data;
  Product({this.status, this.message, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? money;
  String? type;
  int? amount;
  String? taste;
  String? createDate;
  String? updateBy;
  String? updateDate;
  String? createBy;

  Data(
      {this.id,
      this.name,
      this.money,
      this.type,
      this.amount,
      this.taste,
      this.createDate,
      this.updateBy,
      this.updateDate,
      this.createBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    money = json['money'];
    type = json['type'];
    amount = json['amount'];
    taste = json['taste'];
    createDate = json['createDate'];
    updateBy = json['updateBy'];
    updateDate = json['updateDate'];
    createBy = json['createBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['money'] = this.money;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['taste'] = this.taste;
    data['createDate'] = this.createDate;
    data['updateBy'] = this.updateBy;
    data['updateDate'] = this.updateDate;
    data['createBy'] = this.createBy;
    return data;
  }
}
