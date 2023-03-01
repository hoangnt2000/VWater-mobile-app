import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mobile/src/resources/login_page.dart';
import 'package:mobile/src/resources/widget/history_page.dart';
import 'package:mobile/src/resources/home_page.dart';
class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}
class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Image.asset("ic_menu_user.png"),
          title: TextButton(onPressed: (){

          },
            child: Text(
              "tentaixe",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),),
        ),
        ListTile(
          leading: Image.asset("ic_home.png",height: 35,width: 30,),
          title: TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: gotoHome));
          },
              child: Text(
                "Trang chủ",
                style: TextStyle(fontSize: 18, color: Color(0xff323643)),
              ))
        ),


        ListTile(
          leading: Image.asset("ic_menu_history.png"),
          title: TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: gotoHis));
          },
              child: Text(
                "Đơn hàng đã nhận",
                style: TextStyle(fontSize: 18, color: Color(0xff323643)),
              )),

        ),
        ListTile(
          leading: Image.asset("ic_menu_percent.png"),
          title: TextButton(onPressed: (){

          },
            child: Text(
              "Điểm",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),),
        ),

        ListTile(
          leading: Image.asset("ic_menu_notify.png"),
          title: TextButton(onPressed: (){

          },
            child: Text(
              "Thông báo",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),),
        ),
        ListTile(
          leading: Image.asset("ic_menu_help.png"),
          title: TextButton(onPressed: (){

          },
            child: Text(
              "Hổ trợ",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),),
        ),
        Container(
          child: TextButton(
            child: Text("Đăng Xuất"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: gotoLogin));
            },
          ),
        ),
      ],
    );
  }

  void _onPress(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

  }
  Widget gotoLogin(BuildContext context)
  {
    return LoginPage();
  }
  Widget gotoHis(BuildContext context)
  {
    return HistoryPage();
  }
  Widget gotoHome(BuildContext context)
  {
    return HomePage();
  }
}
