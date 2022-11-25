import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';
import 'package:my_app/page/test.dart';
import 'package:my_app/page/test1.dart';
import 'package:my_app/service/api_service.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../utils/size_config.dart';
import 'add_or_edit.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Product? product;
  ProductProvider? productProvider;

  List<DropdownMenuItem<String>> type = [
    'ยี่ห้อ',
    'ประเภท',
    'รสชาติ',
    'ปริมาณ',
    'ราคา'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }).toList();

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);

    super.initState();

    testFn();
  }

  testFn() async {
    Product res = await ApiService.getProduct();
    setState(() {
      product = res;
    });
    productProvider?.setProduct(res.data![0]);
  }

  deleteItem(int? id) {
    // bool res = await ApiService.getProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background1.jpg'),
                      fit: BoxFit.fill)),
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
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => TestPage()),
                                );
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.all(SizeConfig.defaultSize! * 1),
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
                                Navigator.of(context)
                                    .push(
                                  MaterialPageRoute(
                                      builder: (_) => AddOrEditPage(
                                            isAdd: true,
                                          )),
                                )
                                    .then(
                                  (value) {
                                    log(value.toString());
                                    // testFn();
                                  },
                                );
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.all(SizeConfig.defaultSize! * 1),
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Test1()),
                                );
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.all(SizeConfig.defaultSize! * 1),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  'Provider',
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (null != product?.data) ...[
                            ...List.generate(
                              product!.data!.length,
                              (index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.defaultSize! * 2,
                                      left: SizeConfig.defaultSize! * 2,
                                      right: SizeConfig.defaultSize! * 2),
                                  padding: EdgeInsets.all(
                                      SizeConfig.defaultSize! * 1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                    // gradient: LinearGradient(
                                    //   begin: Alignment.topLeft,
                                    //   end: Alignment.bottomRight,
                                    //   stops: [
                                    //     0.1,
                                    //     0.4,
                                    //     0.6,
                                    //     0.9,
                                    //   ],
                                    //   colors: [
                                    //     Colors.yellow,
                                    //     Colors.red,
                                    //     Colors.indigo,
                                    //     Colors.teal,
                                    //   ],
                                    // ),
                                    // image: DecorationImage(
                                    //     image: AssetImage('assets/images/background1.jpg'),
                                    //     fit: BoxFit.fill)
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              right:
                                                  SizeConfig.defaultSize! * 2),
                                          child: Text('${index + 1}')),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'ยี่ห้อ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                    '${product!.data![index].name}')
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('ประเภท',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${product!.data![index].type}')
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('รสชาติ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${product!.data![index].taste}')
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('ปริมาณ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${product!.data![index].amount}')
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('ราคา',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    '${product!.data![index].money}')
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
                                              left:
                                                  SizeConfig.defaultSize! * 1),
                                          padding: EdgeInsets.only(
                                            left: SizeConfig.defaultSize! * 1,
                                            right: SizeConfig.defaultSize! * 1,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            // borderRadius: BorderRadius.circular(15.0),
                                            border: Border.all(
                                                width: 1, color: Colors.black),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            AddOrEditPage(
                                                              itemProduct:
                                                                  product!.data![
                                                                      index],
                                                              isAdd: false,
                                                            )),
                                                  )
                                                      .then(
                                                    (value) {
                                                      testFn();
                                                    },
                                                  );
                                                  ;
                                                },
                                                child: Text(
                                                  'แก้ไข',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                          'ยืนยันการลบ'),
                                                      // content: const Text('AlertDialog description'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: const Text(
                                                              'ยกเลิก'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              deleteItem(
                                                                  product!
                                                                      .data![
                                                                          index]
                                                                      .id),
                                                          child: const Text(
                                                              'ตกลง'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Text('ลบ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    )),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                          'รายละเอียดสินค้า'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'ยี่ห้อ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                Text(
                                                                    '${product!.data![index].name}')
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('ประเภท',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(
                                                                    '${product!.data![index].type}')
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('รสชาติ',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(
                                                                    '${product!.data![index].taste}')
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('ปริมาณ',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(
                                                                    '${product!.data![index].amount}')
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text('ราคา',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                Text(
                                                                    '${product!.data![index].money}')
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child:
                                                              const Text('ปิด'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Text('รายละเอียด',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .underline,
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
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
