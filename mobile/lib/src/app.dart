import 'package:mobile/src/resources/home_page.dart';
import 'package:mobile/src/resources/login_page.dart';
import 'package:mobile/src/resources/widget/history_page.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/resources/order_detail.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()

    );
  }
}