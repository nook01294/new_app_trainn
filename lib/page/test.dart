import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../utils/size_config.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  ProductProvider? productProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Center(
      child: Column(
        children: [
          Text('${productProvider!.getProductt.name}'),
          Text('${productProvider!.getProductt.type}'),
          Text('${productProvider!.getProductt.taste}'),
          Text('${productProvider!.getProductt.amount}'),
          Text('${productProvider!.getProductt.money}'),
          GestureDetector(
            onTap: () {
              // log(MediaQuery.of(context).size.height.toString());
              Navigator.popUntil(context, ModalRoute.withName('/test1'));
              // productProvider?.clearProduct();
            },
            child: Container(
              padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
              decoration: BoxDecoration(
                color: Color(0xff0078FF),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'ลบ',
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 1.6,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
