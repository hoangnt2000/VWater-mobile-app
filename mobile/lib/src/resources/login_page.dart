import 'package:mobile/src/resources/home_page.dart';
import 'package:mobile/src/resources/register_page.dart';
import 'package:mobile/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mobile/src/resources/dialog/msg_dialog.dart';
import 'package:mobile/src/resources/dialog/loading_dialog.dart';

var image_bg =  AssetImage("assets/ic_background.png");

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _emailErr = "Email không hợp lệ";
  var _passErr = "Mật khẩu không hợp lệ";
  var _emailInvalid = false;
  var _passInvalid = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('ic_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Image.asset('ic_driver.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 80),
                child: Text(
                  "VWater Driver",
                  style: TextStyle(fontSize: 50, color: Color(0xFF2A62B1),fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      errorText: _emailInvalid ? _emailErr : null,
                      prefixIcon: Container(
                          width: 50, child: Image.asset("ic_mail.png")),
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 80),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          labelText: "Password",
                          errorText: _passInvalid ? _passErr : null,
                          prefixIcon: Container(
                              width: 50, child: Image.asset("ic_lock.png")),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)))),
                    ),
                    GestureDetector(
                      onTap: _onToggleShowPass,
                      child: Text(
                        _showPass ? "HIDE" : "SHOW",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
              

              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Quên mật khẩu?",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _onLoginClick,
                    child: Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff3277D8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
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

  void _onLoginClick() {
    setState(() {
  if(_emailController.text.length < 6 || !_emailController.text.contains('@'))
    {
      _emailInvalid = true;
    }else{
    _emailInvalid = false;
  }
  if(_passController.text.length <6)
    {
      _passInvalid = true;
    }else{
    _passInvalid = false;
  }
  if(!_emailInvalid && !_passInvalid){
    // Navigator.push(context, MaterialPageRoute(builder: gotoHome));
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }
    });
  }

  void _onToggleShowPass(){
    setState(() {
      _showPass = !_showPass;

    });

  }
}