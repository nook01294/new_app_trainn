import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';
import 'package:my_app/service/api_service.dart';

import '../utils/size_config.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Product? product;

  @override
  void initState() {
    super.initState();

    testFn();
  }

  testFn() async {
    Product res = await ApiService.getProduct();
    // log(res.toString());
    // setState(() {
    //   product = res;
    // });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            // color: Colors.amber,
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 2,
                  top: SizeConfig.defaultSize! * 2),
              padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.defaultSize! * 2,
                        right: SizeConfig.defaultSize! * 2,
                        top: SizeConfig.defaultSize! * 2,
                        bottom: SizeConfig.defaultSize! * 2),
                    padding: EdgeInsets.only(
                        left: SizeConfig.defaultSize! * 2,
                        right: SizeConfig.defaultSize! * 2,
                        top: SizeConfig.defaultSize! * 0.5,
                        bottom: SizeConfig.defaultSize! * 0.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(width: 1, color: Colors.black),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(60, 81, 89, 0.08),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      // controller: controllerValue,
                      // focusNode: node,
                      onTap: () {},
                      style: TextStyle(
                          color: Color(0XFF212121),
                          fontSize: SizeConfig.defaultSize! * 2.0,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                          decoration: BoxDecoration(
                            color: Color(0xff0078FF),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'ค้นหาข้อมูล',
                            style: TextStyle(
                                fontSize: SizeConfig.defaultSize! * 1.6,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.defaultSize! * 4.0,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (_) => AddOrEditOrderPage(
                          //             isAdd: true,
                          //           )),
                          // );
                        },
                        child: Container(
                          padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                          decoration: BoxDecoration(
                            color: Color(0xff00EBFF),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'เพิ่มข้อมูล',
                            style: TextStyle(
                                fontSize: SizeConfig.defaultSize! * 1.6,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (null != product?.data) ...[
              ...List.generate(
                product!.data!.length,
                (index) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.defaultSize! * 2,
                        left: SizeConfig.defaultSize! * 2,
                        right: SizeConfig.defaultSize! * 2),
                    padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                right: SizeConfig.defaultSize! * 2),
                            child: Text('${index + 1}')),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ยี่ห้อ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('${product!.data![index].name}')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ประเภท',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('${product!.data![index].type}')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('รสชาติ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('${product!.data![index].taste}')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ปริมาณ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('${product!.data![index].amount}')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ราคา',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('${product!.data![index].money}')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: SizeConfig.defaultSize! * 10,
                            margin: EdgeInsets.only(
                                left: SizeConfig.defaultSize! * 1),
                            padding: EdgeInsets.only(
                              left: SizeConfig.defaultSize! * 1,
                              right: SizeConfig.defaultSize! * 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(width: 1, color: Colors.black),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //       builder: (_) => AddOrEditOrderPage(
                                    //             isAdd: false,
                                    //             orderData: listOrder[index],
                                    //           )),
                                    // );
                                  },
                                  child: Text(
                                    'แก้ไข',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text('ลบ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      )),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text('รายละเอียด',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ]
          ],
        )),
      )),
    );
  }
}
