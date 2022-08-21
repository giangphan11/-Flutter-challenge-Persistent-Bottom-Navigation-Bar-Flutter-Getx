import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/di/init_di.dart';
import 'package:getx_demo/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: InitDI(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const MyHomePage()
    );
  }
}