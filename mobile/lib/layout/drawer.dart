import 'package:flutter/material.dart';
import 'package:app_shipper/received.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo_sidebar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'VWATER',
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
              )
            ]),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Trang chủ'),
            onTap: () {
              // Do something
            },
          ),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Đơn hàng đã nhận'),
            onTap: () {
              // Do something
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderReceivedPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Đơn hàng đã hoàn thành'),
            onTap: () {
              // Do something
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderReceivedPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Đăng xuất'),
            onTap: () {
              // Do something
            },
          ),
        ],
      ),
    );
  }
}
