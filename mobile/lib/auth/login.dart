import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:app_shipper/auth/phone.dart';
import 'dart:convert';

import '../home.dart';

Future<http.Response> login(String email, String password) async {
  final url = Uri.parse('https://shipper.thanhtienkr.dev/api/v1.0.0/login');
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final body = jsonEncode(<String, String>{
    'email': email,
    'password': password,
  });
  final response = await http.post(url, headers: headers, body: body);
  return response;
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Lỗi'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _onLoginButtonPressed() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      final response = await login(email, password);
      final responseBody = jsonDecode(response.body); // Lấy nội dung phản hồi

      if (response.statusCode == 200) {
        // Đăng nhập thành công
        final token = responseBody['data']['access_token'];
        // Lưu token vào local storage hoặc state management để sử dụng sau này
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        // Chuyển sang trang chủ
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Đăng nhập thất bại
        final errorMessage = response.reasonPhrase;
        _showErrorDialog(errorMessage!);
      }
    } catch (error) {
      print(error);
      final errorMessage = 'Có lỗi xảy ra khi đăng nhập';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80, bottom: 80),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 168.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/iconlogin.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'VWATER DRIVER',
                    style: TextStyle(
                      color: Color(0xFF306FC7),
                      fontFamily: 'Gorditas',
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      decoration: TextDecoration.none,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        // Lưu giá trị email vào _emailController
                        _emailController.text = value;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        // Lưu giá trị email vào _emailController
                        _passwordController.text = value;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _onLoginButtonPressed();
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFF9642),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
