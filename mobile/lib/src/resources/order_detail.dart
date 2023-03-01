import 'package:mobile/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:mobile/src/resources/home_page.dart';

class orderDetail extends StatefulWidget {
  @override
  _orderDetailState createState() => _orderDetailState();
}
class _orderDetailState extends State<orderDetail>
{
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
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Container(
                      child: Text(
                        'VH-01',
                        style: TextStyle(color: Color(0xFF2A62B1),fontWeight: FontWeight.w600),
                      ),
                    ),
                    leading: BackButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      color: Colors.black,
                    ),
                  ),
                  ///box1
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 6, 26),
                    padding:  EdgeInsets.fromLTRB(12, 6, 12, 0),
                    width:  500,
                    height: 150,
                    decoration:  BoxDecoration (
                      color:  Color(0xfff7f8fa),
                      borderRadius:  BorderRadius.circular(13),
                      boxShadow:  [
                        BoxShadow(
                          color:  Color(0x19606470),
                          offset:  Offset(0, 5),
                          blurRadius:  10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:  EdgeInsets.fromLTRB(14.42, 0, 99.91, 10.08),
                          width:  double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:  EdgeInsets.fromLTRB(5, 0, 50, 0),
                                width: 100,
                                height: 20,
                                decoration: BoxDecoration(
                                    color:  Color(0xff42fc3e),
                                    borderRadius:  BorderRadius.circular(20)
                                ),
                                child: Text(
                                  "Đã thanh toán",
                                  style: TextStyle(
                                    fontWeight:  FontWeight.w700,
                                    height:  1.2125,
                                    color:  Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                margin:  EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                  "Thông tin đơn hàng",
                                  style: TextStyle(
                                    fontSize:  18,
                                    fontWeight:  FontWeight.w700,
                                    height:  1.2125,
                                    color:  Color(0xff000000),
                                  ),
                                ),
                              )
                              ],
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 97.88, 0),
                          width:  double.infinity,
                          child: Row(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:  EdgeInsets.fromLTRB(0, 2.23, 9.36, 0),
                                child: Column(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tổng tiền thu hộ: ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height:  6,
                                    ),
                                    Text(
                                      "Trạng thái đơn: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height:  6,
                                    ),
                                    Text(
                                      "Phương thức thanh toán: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height:  6,
                                    ),
                                    Text(
                                      "Ghi chú: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:  150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding:  EdgeInsets.fromLTRB(0, 0, 0, 9),
                                      width:  double.infinity,
                                      child: Column(
                                        crossAxisAlignment:  CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(60, 0, 0, 5),
                                            child: Text(
                                              "0 Đ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(30, 0, 0, 5),
                                            width:  90,
                                            height:  20,
                                            decoration:  BoxDecoration (
                                              color:  Color(0xff42fc3e),
                                              borderRadius:  BorderRadius.circular(36),
                                              boxShadow:  [
                                                BoxShadow(
                                                  color:  Color(0x19606470),
                                                  offset:  Offset(0, 5),
                                                  blurRadius:  10,
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Hoàn thành",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(40, 0, 0, 5),
                                            width:  90,
                                            height:  20,
                                            child: Center(
                                              child: Text(
                                                "Tiền mặt",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(15, 0, 0, 0),
                                            child: Center(
                                              child: Text(
                                                "Không",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
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
                  ),
                  ///box2
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 6, 0),
                    padding:  EdgeInsets.fromLTRB(12, 5, 5, 0),
                    width:  500,
                    height: 150,
                    decoration:  BoxDecoration (
                      color:  Color(0xfff7f8fa),
                      borderRadius:  BorderRadius.circular(13),
                      boxShadow:  [
                        BoxShadow(
                          color:  Color(0x19606470),
                          offset:  Offset(0, 5),
                          blurRadius:  10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:  EdgeInsets.fromLTRB(13.92, 0, 119.12, 10),
                          width:  double.infinity,
                          child: Row(
                            crossAxisAlignment:  CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:  EdgeInsets.fromLTRB(20, 0, 35, 0),
                                width:  20,
                                height:  25,
                              ),
                              Container(
                                margin:  EdgeInsets.fromLTRB(80, 0, 0, 0),
                                child: Text(
                                  "Thông tin lấy hàng",
                                  style: TextStyle(
                                    fontSize:  18,
                                    fontWeight:  FontWeight.w700,
                                    color:  Color(0xff000000),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width:  double.infinity,
                          height:  100,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                    width:  110,
                                    height:  250,
                                    child: Column(
                                      crossAxisAlignment:  CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:  EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          child: Text(
                                            "Điểm lấy: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:  EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          child: Text(
                                            "Người gửi: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:  EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          child: Text(
                                            "SDT cửa hàng: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:  EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          child: Text(
                                            "Thời gian đặt: ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),
                              Positioned(left: 65,top: 0,
                                  child: Align(
                                    child: SizedBox(
                                      // width: 380,
                                      // height: 50,
                                      child: Text(
                                        "S01.01, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                              Positioned(
                                left:  200,
                                top:  20,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    child:
                                    Text(
                                      'Mỹ Hạnh',
                                      style: TextStyle(
                                        fontSize:  15,
                                        fontWeight:  FontWeight.w600,
                                        color:  Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // DTW (6:986)
                                left:  200,
                                top:  45,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    width:  100,
                                    height:  25,
                                    child:
                                    Text(
                                      '0965123456',
                                      style:  TextStyle (
                                        fontSize:  15,
                                        fontWeight:  FontWeight.w600,
                                        decoration:  TextDecoration.underline,
                                        color:  Color(0xff0f6cf0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:  200,
                                top:  70,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    child:
                                    Text(
                                      '17:58:23',
                                      style: TextStyle(
                                        fontSize:  15,
                                        fontWeight:  FontWeight.w600,
                                        color:  Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ///box3
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 25, 0, 20),
                    padding:  EdgeInsets.fromLTRB(10, 6, 0, 0),
                    width:  500,
                    height: 150,
                    decoration:  BoxDecoration (
                      color:  Color(0xfff7f8fa),
                      borderRadius:  BorderRadius.circular(13),
                      boxShadow:  [
                        BoxShadow(
                          color:  Color(0x19606470),
                          offset:  Offset(0, 5),
                          blurRadius:  10,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:  EdgeInsets.fromLTRB(14.42, 0, 99.91, 10.08),
                          width:  double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:  EdgeInsets.fromLTRB(5, 0, 50, 0),
                                width: 100,
                                height: 20,
                              ),
                              Container(
                                margin:  EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                  "Thông tin giao hàng",
                                  style: TextStyle(
                                    fontSize:  18,
                                    fontWeight:  FontWeight.w700,
                                    height:  1.2125,
                                    color:  Color(0xff000000),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 97.88, 0),
                          width:  double.infinity,
                          child: Row(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:  EdgeInsets.fromLTRB(0, 2.23, 9.36, 0),
                                child: Column(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Người nhận: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height:  6,
                                    ),
                                    Text(
                                      "Điểm giao: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height:  6,
                                    ),
                                    Text(
                                      "SDT khách hàng: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(
                                      height:  6,
                                    ),
                                    Text(
                                      "Ghi chú: ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:  150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding:  EdgeInsets.fromLTRB(0, 0, 0, 9),
                                      width:  double.infinity,
                                      child: Column(
                                        crossAxisAlignment:  CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(60, 0, 0, 5),
                                            child: Text(
                                              "Chị XXX",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(30, 0, 0, 5),
                                            child: Center(
                                              child: Text(
                                                "S101",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(40, 0, 0, 5),
                                            width:  90,
                                            height:  20,
                                            child: Center(
                                              child:
                                              Text(
                                                '0965123456',
                                                style:  TextStyle (
                                                  fontSize:  15,
                                                  fontWeight:  FontWeight.w600,
                                                  decoration:  TextDecoration.underline,
                                                  color:  Color(0xff0f6cf0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:  EdgeInsets.fromLTRB(15, 0, 0, 0),
                                            child: Center(
                                              child: Text(
                                                "2 Aqua - giao S101",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
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
                  ),

                ],
              ),
            ),
          ],
        ),

      ),

    );
  }
    Widget gotoHome(BuildContext context){
    return HomePage();
    }
}