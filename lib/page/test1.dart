import 'package:flutter/material.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  List<String>? items = [
    "assets/images/background.webp",
    "assets/images/background1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: ListView.builder(
          itemCount: items!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(items![index]))),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
