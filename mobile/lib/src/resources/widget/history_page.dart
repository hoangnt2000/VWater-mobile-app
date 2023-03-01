import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:mobile/src/resources/widget/home_menu.dart';
import 'package:mobile/src/resources/order_detail.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width:  double.infinity,
        decoration:  BoxDecoration (
          image:  DecorationImage (
            fit:  BoxFit.cover,
            image:  AssetImage("ic_background.png"),
            ),
          ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            title: Center(
                              child: Text(
                                'VWater',
                                style: TextStyle(color: Color(0xFF2A62B1),fontWeight: FontWeight.w600),
                              ),),
                            leading: TextButton(
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Image.asset("ic_menu.png")),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        left: 260, top: 50,
                        child: Align(
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Text(
                              "Đơn hàng đã nhận",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25, color: Color(0xFF000000),fontWeight: FontWeight.w900),
                            ),
                          ),
                        )),

                    /////////////////////////
                    Positioned( left: 50,top: 30,
                      child: Container(
                        width: 600,
                        height: 190,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              padding: EdgeInsets.fromLTRB(5, 4, 4, 5),
                              width: 280,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Color(0xffff9642),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x19606470),
                                    offset: Offset(0, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 00, 5),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 5, 00, 0),
                                          child: Text(
                                              "Tổng đơn: 5",
                                              style:
                                              TextStyle(fontSize: 18,
                                                  color: Color(0xFF000000),
                                                  fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: Text("Tổng COD đã thu: 195,000 VNĐ ",
                                              style: TextStyle(fontSize: 18, color: Color(0xFF000000),fontWeight: FontWeight.w400)
                                          ),

                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ///Thanh Toán
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5,10, 5),
                              width: 280,
                              height: 65 ,
                              decoration: BoxDecoration(
                                color: Color(0xffff9642),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:  [
                                  BoxShadow(
                                    color:  Color(0x19606470),
                                    offset:  Offset(0, 5),
                                    blurRadius:  10,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 15, 5),
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(5, 0, 40, 0),
                                          child: Text(
                                              "Đã Thanh Toán :  2",
                                              style: TextStyle(fontSize: 18, color: Color(0xFF000000),fontWeight: FontWeight.w400)
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(2, 0, 12, 0),
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(5, 0, 40, 0),
                                          child: Text(
                                              "Đơn COD :  2",
                                              style: TextStyle(fontSize: 18, color: Color(0xFF000000),fontWeight: FontWeight.w400)
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ///Fillter
                    Positioned( left: 130, top: 170,
                      child: Container(
                        width: 500,
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){

                            }, child: Image.asset("ic_filter.png",width: 30,height: 15),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 260, 1),
                            ),
                            TextButton(onPressed: (){}, child:
                            Image.asset("ic_refresh.png",width: 20,height: 15),
                            )
                          ],
                        ),
                      ),
                    ),

                    ///Frame
                    Positioned(
                        left: 50,top: 200,
                        child: Container(
                          width: 570, height: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:  EdgeInsets.fromLTRB(10, 0, 5, 2),
                                width:  double.infinity,
                                height:  150,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow:[
                                      BoxShadow(
                                        color:  Color(0x19606470),
                                        offset:  Offset(0, 5),
                                        blurRadius:  10,
                                      )
                                    ]
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 7, 0),
                                      width: 15,
                                      height: 100,
                                      child: Image.asset("line.png",width: 15,height: 100,),
                                    ),
                                    Container(
                                      width: 500,
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            width: double.infinity,
                                            height: 40,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin:  EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                  child: Text(
                                                    "VH-01",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 2, 11, 5),
                                                  width:  110,
                                                  height:  double.infinity,
                                                  decoration:  BoxDecoration (
                                                    color:  Colors.black26,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Chưa giao",
                                                      style: TextStyle(
                                                        fontSize:  15,
                                                        fontWeight:  FontWeight.w400,
                                                        fontStyle:  FontStyle.italic,
                                                        color:  Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:  EdgeInsets.fromLTRB(0, 2, 0, 5),
                                                  height:  double.infinity,
                                                  decoration:  BoxDecoration (
                                                    color:  Color(0xfff3f3e7),
                                                  ),
                                                  child: Text(
                                                    "Tiền mặt",
                                                    style: TextStyle(
                                                      fontSize:  15,
                                                      fontWeight:  FontWeight.w400,
                                                      fontStyle:  FontStyle.italic,
                                                      color:  Color(0xff39a137),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ///Text
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            width:  600,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:  CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                        child: Text(
                                                            "Điểm lấy: S9.02A, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9"
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                                  width:  double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 212, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Điểm Giao: "
                                                              ),
                                                            ),
                                                            Text("S7.02B")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Giờ Giao: "
                                                              ),
                                                            ),
                                                            Text("Buổi sáng")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Ghi chú: "
                                                              ),
                                                            ),
                                                            Text("Trước 12h")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: TextButton(onPressed:(){
                                                                Navigator.push(context, MaterialPageRoute(builder: gotoDetail));
                                                              },
                                                                  child: Text("Chi Tiết")),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),

                        )),
                    Positioned(
                        left: 50,top: 355,
                        child: Container(
                          width: 570, height: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:  EdgeInsets.fromLTRB(10, 0, 5, 2),
                                width:  double.infinity,
                                height:  150,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow:[
                                      BoxShadow(
                                        color:  Color(0x19606470),
                                        offset:  Offset(0, 5),
                                        blurRadius:  10,
                                      )
                                    ]
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 7, 0),
                                      width: 15,
                                      height: 100,
                                      child: Image.asset("line.png",width: 15,height: 100,),
                                    ),
                                    Container(
                                      width: 500,
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            width: double.infinity,
                                            height: 40,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin:  EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                  child: Text(
                                                    "VH-02",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 2, 11, 5),
                                                  width:  110,
                                                  height:  double.infinity,
                                                  decoration:  BoxDecoration (
                                                    color:   Color(0xff42fc3e),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Hoàn thành",
                                                      style: TextStyle(
                                                        fontSize:  15,
                                                        fontWeight:  FontWeight.w400,
                                                        fontStyle:  FontStyle.italic,
                                                        color:  Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:  EdgeInsets.fromLTRB(0, 2, 0, 5),
                                                  height:  double.infinity,
                                                  decoration:  BoxDecoration (
                                                    color:  Color(0xfff3f3e7),
                                                  ),
                                                  child: Text(
                                                    "Chuyển khoản",
                                                    style: TextStyle(
                                                      fontSize:  15,
                                                      fontWeight:  FontWeight.w400,
                                                      fontStyle:  FontStyle.italic,
                                                      color:  Color(0xff39a137),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ///Text
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            width:  600,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:  CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                        child: Text(
                                                            "Điểm lấy: S01.01, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9"
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                                  width:  double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 212, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Điểm Giao: "
                                                              ),
                                                            ),
                                                            Text("S101")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Giờ Giao: "
                                                              ),
                                                            ),
                                                            Text("Buổi tối")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Ghi chú: "
                                                              ),
                                                            ),
                                                            Text("2 Aqua - giao S101")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: TextButton(onPressed:(){
                                                                Navigator.push(context, MaterialPageRoute(builder: gotoDetail));
                                                              },
                                                                  child: Text("Chi Tiết")),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),

                        )),
                    Positioned(
                        left: 50,top: 510,
                        child: Container(
                          width: 570, height: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding:  EdgeInsets.fromLTRB(10, 0, 5, 2),
                                width:  double.infinity,
                                height:  150,
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow:[
                                      BoxShadow(
                                        color:  Color(0x19606470),
                                        offset:  Offset(0, 5),
                                        blurRadius:  10,
                                      )
                                    ]
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 7, 0),
                                      width: 15,
                                      height: 100,
                                      child: Image.asset("line.png",width: 15,height: 100,),
                                    ),
                                    Container(
                                      width: 500,
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            width: double.infinity,
                                            height: 40,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin:  EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                  child: Text(
                                                    "VH-03",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 2, 11, 5),
                                                  width:  110,
                                                  height:  double.infinity,
                                                  decoration:  BoxDecoration (
                                                    color:   Color(0xff42fc3e),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Hoàn thành",
                                                      style: TextStyle(
                                                        fontSize:  15,
                                                        fontWeight:  FontWeight.w400,
                                                        fontStyle:  FontStyle.italic,
                                                        color:  Color(0xff000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:  EdgeInsets.fromLTRB(0, 2, 0, 5),
                                                  height:  double.infinity,
                                                  decoration:  BoxDecoration (
                                                    color:  Color(0xfff3f3e7),
                                                  ),
                                                  child: Text(
                                                    "Tiền mặt",
                                                    style: TextStyle(
                                                      fontSize:  15,
                                                      fontWeight:  FontWeight.w400,
                                                      fontStyle:  FontStyle.italic,
                                                      color:  Color(0xff39a137),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ///Text
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            width:  600,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  child: Row(
                                                    crossAxisAlignment:  CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                        child: Text(
                                                            "Điểm lấy: S2.02, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9"
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                                  width:  double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 212, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Điểm Giao: "
                                                              ),
                                                            ),
                                                            Text("S205.1715")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Giờ Giao: "
                                                              ),
                                                            ),
                                                            Text("Buổi chiều")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: Text(
                                                                  "Ghi chú: "
                                                              ),
                                                            ),
                                                            Text("2 vinawa - giao 1945")
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:  EdgeInsets.fromLTRB(0, 0, 215, 3),
                                                        width:  double.infinity,
                                                        child: Row(
                                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                                              child: TextButton(onPressed:(){
                                                                Navigator.push(context, MaterialPageRoute(builder: gotoDetail));
                                                              },
                                                                  child: Text("Chi Tiết")),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),

                        )),

                  ],
                ),
        ),
    drawer: Drawer(
    child: HomeMenu(),
    ),
      );
  }

  Widget gotoDetail(BuildContext context)
  {
    return orderDetail();
  }
}

