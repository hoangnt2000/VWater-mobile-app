import 'package:flutter/material.dart';
import 'package:app_shipper/auth/login.dart';
import 'package:app_shipper/auth/verify.dart';
import 'package:app_shipper/auth/change-pass.dart';
import 'package:app_shipper/home.dart';
import 'package:app_shipper/detail.dart';
import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: LoginPage(),
    );
  }
}
