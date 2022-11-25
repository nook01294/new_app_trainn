import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';

import '../service/api_service.dart';
import '../utils/size_config.dart';

class AddOrEditPage extends StatefulWidget {
  final bool isAdd;
  final Data? itemProduct;
  const AddOrEditPage({Key? key, this.itemProduct, required this.isAdd})
      : super(key: key);

  @override
  State<AddOrEditPage> createState() => _AddOrEditPageState();
}

class _AddOrEditPageState extends State<AddOrEditPage> {
  TextEditingController brandProduct = TextEditingController();
  String? typeProduct;

  @override
  void initState() {
    super.initState();
    if (!widget.isAdd) {
      brandProduct.text = widget.itemProduct!.name!;
      typeProduct = widget.itemProduct!.type!;
    }
  }

  @override
  void dispose() {
    typeProduct;
    super.dispose();
  }

  List<DropdownMenuItem<String>> type = ['กล่อง', 'ซอง', 'ถุง', 'แพ็ค', 'ถ้วย']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }).toList();

  saveFn(Data? value) async {
    // bool res = await ApiService.saveProduct(value!);
    bool res = true;
    if (res) {
      successDialog();
    } else {
      falseDialog();
    }
  }

  successDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('บันทึกข้อมูลสำเร็จ'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: SizeConfig.defaultSize! * 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 3),
                  child: Text(
                    'บันทึกข้อมูลสำเร็จ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize! * 2.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('ปิด'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  falseDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('บันทึกข้อมูลสำเร็จ'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red,
                  size: SizeConfig.defaultSize! * 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 3),
                  child: Text(
                    'บันทึกข้อมูลไม่สำเร็จ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize! * 2.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('ปิด'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdd ? 'เพิ่มข้อมูลสินค้า' : 'แก้ไขข้อมูลสินค้า'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 2,
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultSize! * 1),
                    child: Text(
                      'ยี่ห้อ',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * 1,
                          right: SizeConfig.defaultSize! * 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all()),
                      child: TextFormField(
                        controller: brandProduct,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 2,
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultSize! * 1),
                    child: Text(
                      'ประเภท',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: SizeConfig.defaultSize! * 1,
                        right: SizeConfig.defaultSize! * 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(Icons.arrow_drop_down_outlined,
                            color: Colors.grey.withOpacity(0.7)),
                        items: type,
                        onChanged: (String? value) {
                          setState(() {
                            typeProduct = value;
                          });
                          print(typeProduct);
                        },
                        hint: Text(
                          "กรุณาเลือกประเภท",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        value: typeProduct,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 2,
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultSize! * 1),
                    child: Text(
                      'รสชาติ',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * 1,
                          right: SizeConfig.defaultSize! * 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all()),
                      child: TextFormField())
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 2,
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultSize! * 1),
                    child: Text(
                      'ปริมาณ',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * 1,
                          right: SizeConfig.defaultSize! * 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all()),
                      child: TextFormField())
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * 2,
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: SizeConfig.defaultSize! * 1),
                    child: Text(
                      'ราคา',
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: SizeConfig.defaultSize! * 1,
                          right: SizeConfig.defaultSize! * 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all()),
                      child: TextFormField())
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Data? value = Data(
                    name: brandProduct.text,
                    type: typeProduct,
                    taste: "เผ็ด",
                    amount: 50,
                    money: 200);
                saveFn(value);

                // Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                decoration: BoxDecoration(
                  color: Color(0xff0078FF),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'บันทึกข้อมูล',
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * 1.6,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
