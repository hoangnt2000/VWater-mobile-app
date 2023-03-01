import 'package:mobile/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:mobile/src/resources/login_page.dart';
import 'package:mobile/src/resources/order_detail.dart';
import 'package:mobile/src/resources/widget/order_list.dart';
import 'package:mobile/src/resources/widget/home_menu.dart';
import 'package:mobile/src/resources/widget/notifi_menu.dart';
import 'package:mobile/src/resources/widget/order_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width:  double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('ic_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              right: 0,
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
                    actions: <Widget>[
                      IconButton(
                          onPressed: (){
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: Image.asset("ic_notify.png")),
                    ],
              ),
               Container(
                 width:  double.infinity,
                 height:  800,
                 child: Stack(
                   children: [
                     Positioned(
                       // danhschnhngnBi (6:277)
                       left:  160,
                       top:  0,
                       child:
                       Align(
                         child:
                         SizedBox(
                           width:  300,
                           height:  40,
                           child:
                           Text(
                             'Danh sách đơn hàng',
                             textAlign:  TextAlign.center,
                             style: TextStyle(fontSize: 25, color: Color(0xFF000000),fontWeight: FontWeight.w900),
                           ),
                         ),
                       ),
                     ),
                     Positioned( left: 70, top:  40,
                         child: Container(
                           width:  500,
                           height:  70,
                           child: Row(
                             crossAxisAlignment:  CrossAxisAlignment.center,
                             children: [
                               Container(
                                 margin:  EdgeInsets.fromLTRB(0, 0, 17, 0),
                                 padding:  EdgeInsets.fromLTRB(13, 12, 19, 11),
                                 height:  80,
                                 decoration:  BoxDecoration (
                                   color:  Color(0xffff9642),
                                   borderRadius:  BorderRadius.circular(6),
                                   boxShadow:  [
                                     BoxShadow(
                                       color:  Color(0x19606470),
                                       offset:  Offset(0, 5),
                                       blurRadius:  10,
                                     ),
                                   ],
                                 ),
                                 child: Row(
                                   crossAxisAlignment:  CrossAxisAlignment.center,
                                   children: [
                                     Container(
                                       margin:  EdgeInsets.fromLTRB(0, 0, 50, 0),
                                       child: Text(
                                         "Tổng đơn: ",
                                         style:
                                         TextStyle(fontSize: 18,
                                             color: Color(0xFF000000),
                                             fontWeight: FontWeight.w600),
                                       ),
                                     ),
                                     Text(
                                         "5",
                                       style:
                                       TextStyle(fontSize: 18,
                                           color: Color(0xFF000000),
                                           fontWeight: FontWeight.w600),
                                     )
                                   ],
                                 ),
                               ),
                               Container(
                                 padding:  EdgeInsets.fromLTRB(5, 2, 5, 1),
                                 width:  200,
                                 height:  double.infinity,
                                 decoration:  BoxDecoration (
                                   color:  Color(0xffff9642),
                                   borderRadius:  BorderRadius.circular(6),
                                   boxShadow:  [
                                     BoxShadow(
                                       color:  Color(0x19606470),
                                       offset:  Offset(0, 5),
                                       blurRadius:  10,
                                     ),
                                   ],
                                 ),
                                 child: Column(
                                   crossAxisAlignment:  CrossAxisAlignment.center,
                                   children: [
                                     Container(
                                       margin:  EdgeInsets.fromLTRB(0, 0, 14, 3),
                                       width:  double.infinity,
                                       child: Row(
                                         crossAxisAlignment:  CrossAxisAlignment.center,
                                         children: [
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                             child: Text(
                                               "Đã thanh toán: ",
                                               style:
                                               TextStyle(fontSize: 18,
                                                   color: Color(0xFF000000),
                                                   fontWeight: FontWeight.w600),
                                             ),
                                           ),
                                           Text(
                                             "1",
                                             style:
                                             TextStyle(fontSize: 18,
                                                 color: Color(0xFF000000),
                                                 fontWeight: FontWeight.w600),
                                           )
                                         ],
                                       ),
                                     ),
                                     Container(
                                       margin:  EdgeInsets.fromLTRB(2, 0, 12, 0),
                                       width:  double.infinity,
                                       child: Row(
                                         crossAxisAlignment:  CrossAxisAlignment.center,
                                         children: [
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(0, 0, 40, 0),
                                             child: Text(
                                               "Đơn COD: ",
                                               style:
                                               TextStyle(fontSize: 18,
                                                   color: Color(0xFF000000),
                                                   fontWeight: FontWeight.w600),
                                             ),
                                           ),
                                           Text(
                                             "2",
                                             style:
                                             TextStyle(fontSize: 18,
                                                 color: Color(0xFF000000),
                                                 fontWeight: FontWeight.w600),
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
                     ///filter, refesh
                     Positioned( left: 70, top: 110,
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
                     ///frame 1
                     Positioned(left:  0, top:  143,
                         child: Container(
                           width:  540,
                           height:  200,
                           child: Column(
                             crossAxisAlignment:  CrossAxisAlignment.center,
                             children: [
                               Container(
                                 padding:  EdgeInsets.fromLTRB(0, 3, 6, 2),
                                 width:  double.infinity,
                                 height:  150,
                                 decoration:  BoxDecoration (
                                   color:  Color(0xffffffff),
                                   borderRadius:  BorderRadius.circular(13),
                                   boxShadow:  [
                                     BoxShadow(
                                       color:  Color(0x19606470),
                                       offset:  Offset(0, 5),
                                       blurRadius:  10,
                                     ),
                                   ],
                                 ),
                                 child: Row(
                                   crossAxisAlignment:  CrossAxisAlignment.center,
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
                                         crossAxisAlignment:  CrossAxisAlignment.start,
                                         children: [
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(0, 0, 0, 3),
                                             width:  double.infinity,
                                             height:  30,
                                             child: Row(
                                               crossAxisAlignment:  CrossAxisAlignment.center,
                                               children: [
                                                 Container(
                                                   margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                                                   child: Text(
                                                     "VH-01",
                                                     style: TextStyle(
                                                       fontSize: 20,
                                                       fontWeight: FontWeight.w700,
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin: EdgeInsets.fromLTRB(0, 0, 10, 5),
                                                   width:  30,
                                                   height:  double.infinity,
                                                   decoration:  BoxDecoration (
                                                     color:  Color(0xfff3f72d),
                                                   ),
                                                   child: Center(
                                                     child: Text(
                                                       "Mới",
                                                       style: TextStyle(
                                                         fontSize: 15,
                                                         fontWeight: FontWeight.w500,
                                                         fontStyle: FontStyle.italic
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(0, 2, 0, 4),
                                                   padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                   height:  double.infinity,
                                                   decoration:  BoxDecoration (
                                                     color:  Color(0xfff3f3e7),
                                                   ),
                                                   child: Text(
                                                     "Tiền mặt",
                                                     style: TextStyle(
                                                         fontSize: 15,
                                                         fontWeight: FontWeight.w500,
                                                         fontStyle: FontStyle.italic
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(280, 2, 0, 0),
                                                   padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                   child: TextButton(onPressed: (){
                                                     
                                                   }, child: Image.asset("ic_plus.png",width: 30,height: 30)),
                                                 )
                                               ],
                                             ),
                                           ),
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(1, 0, 0, 0),
                                             width:  500,
                                             child: Column(
                                               crossAxisAlignment:  CrossAxisAlignment.center,
                                               children: [
                                                 Container(
                                                   width: double.infinity,
                                                   child: Row(
                                                     crossAxisAlignment:  CrossAxisAlignment.center,
                                                     children: [
                                                       Container(
                                                         margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                         child: Text(
                                                           "Điểm lấy: ",
                                                         ),
                                                       ),
                                                       Text("S9.02A, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9")
                                                     ],
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(0, 05, 0, 0),
                                                   width: double.infinity,
                                                   child:Column(
                                                     crossAxisAlignment:  CrossAxisAlignment.start,
                                                     children: [
                                                       Container(
                                                         margin:  EdgeInsets.fromLTRB(0, 0, 212, 3),
                                                         width:  double.infinity,
                                                         child: Row(
                                                           crossAxisAlignment:  CrossAxisAlignment.center,
                                                           children: [
                                                             Container(
                                                               margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                               child: Text(
                                                                 "Điểm giao: "
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
                               ),

                             ],
                           ),
                         )),
                     ///frame 2
                     Positioned(
                         left:  0, top:  300,
                         child: Container(
                           width:  540,
                           height:  200,
                           child: Column(
                             crossAxisAlignment:  CrossAxisAlignment.center,
                             children: [
                               Container(
                                 padding:  EdgeInsets.fromLTRB(0, 3, 6, 2),
                                 width:  double.infinity,
                                 height:  150,
                                 decoration:  BoxDecoration (
                                   color:  Color(0xffffffff),
                                   borderRadius:  BorderRadius.circular(13),
                                   boxShadow:  [
                                     BoxShadow(
                                       color:  Color(0x19606470),
                                       offset:  Offset(0, 5),
                                       blurRadius:  10,
                                     ),
                                   ],
                                 ),
                                 child: Row(
                                   crossAxisAlignment:  CrossAxisAlignment.center,
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
                                         crossAxisAlignment:  CrossAxisAlignment.start,
                                         children: [
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(0, 0, 0, 3),
                                             width:  double.infinity,
                                             height:  30,
                                             child: Row(
                                               crossAxisAlignment:  CrossAxisAlignment.center,
                                               children: [
                                                 Container(
                                                   margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                                                   child: Text(
                                                     "VH-01",
                                                     style: TextStyle(
                                                       fontSize: 20,
                                                       fontWeight: FontWeight.w700,
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin: EdgeInsets.fromLTRB(0, 0, 10, 5),
                                                   width:  30,
                                                   height:  double.infinity,
                                                   decoration:  BoxDecoration (
                                                     color:  Color(0xfff3f72d),
                                                   ),
                                                   child: Center(
                                                     child: Text(
                                                       "Mới",
                                                       style: TextStyle(
                                                           fontSize: 15,
                                                           fontWeight: FontWeight.w500,
                                                           fontStyle: FontStyle.italic
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(0, 2, 0, 4),
                                                   padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                   height:  double.infinity,
                                                   decoration:  BoxDecoration (
                                                     color:  Color(0xfff3f3e7),
                                                   ),
                                                   child: Text(
                                                     "Tiền mặt",
                                                     style: TextStyle(
                                                         fontSize: 15,
                                                         fontWeight: FontWeight.w500,
                                                         fontStyle: FontStyle.italic
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(280, 2, 0, 0),
                                                   padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                   child: TextButton(onPressed: (){

                                                   }, child: Image.asset("ic_plus.png",width: 30,height: 30)),
                                                 )
                                               ],
                                             ),
                                           ),
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(1, 0, 0, 0),
                                             width:  500,
                                             child: Column(
                                               crossAxisAlignment:  CrossAxisAlignment.center,
                                               children: [
                                                 Container(
                                                   width: double.infinity,
                                                   child: Row(
                                                     crossAxisAlignment:  CrossAxisAlignment.center,
                                                     children: [
                                                       Container(
                                                         margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                         child: Text(
                                                           "Điểm lấy: ",
                                                         ),
                                                       ),
                                                       Text("S9.02A, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9")
                                                     ],
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(0, 05, 0, 0),
                                                   width: double.infinity,
                                                   child:Column(
                                                     crossAxisAlignment:  CrossAxisAlignment.start,
                                                     children: [
                                                       Container(
                                                         margin:  EdgeInsets.fromLTRB(0, 0, 212, 3),
                                                         width:  double.infinity,
                                                         child: Row(
                                                           crossAxisAlignment:  CrossAxisAlignment.center,
                                                           children: [
                                                             Container(
                                                               margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                               child: Text(
                                                                   "Điểm giao: "
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
                               ),

                             ],
                           ),
                         )),
                     Positioned(
                         left:  0, top:  458,
                         child: Container(
                           width:  540,
                           height:  200,
                           child: Column(
                             crossAxisAlignment:  CrossAxisAlignment.center,
                             children: [
                               Container(
                                 padding:  EdgeInsets.fromLTRB(0, 3, 6, 2),
                                 width:  double.infinity,
                                 height:  150,
                                 decoration:  BoxDecoration (
                                   color:  Color(0xffffffff),
                                   borderRadius:  BorderRadius.circular(13),
                                   boxShadow:  [
                                     BoxShadow(
                                       color:  Color(0x19606470),
                                       offset:  Offset(0, 5),
                                       blurRadius:  10,
                                     ),
                                   ],
                                 ),
                                 child: Row(
                                   crossAxisAlignment:  CrossAxisAlignment.center,
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
                                         crossAxisAlignment:  CrossAxisAlignment.start,
                                         children: [
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(0, 0, 0, 3),
                                             width:  double.infinity,
                                             height:  30,
                                             child: Row(
                                               crossAxisAlignment:  CrossAxisAlignment.center,
                                               children: [
                                                 Container(
                                                   margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                                                   child: Text(
                                                     "VH-01",
                                                     style: TextStyle(
                                                       fontSize: 20,
                                                       fontWeight: FontWeight.w700,
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin: EdgeInsets.fromLTRB(0, 0, 10, 5),
                                                   width:  30,
                                                   height:  double.infinity,
                                                   decoration:  BoxDecoration (
                                                     color:  Color(0xfff3f72d),
                                                   ),
                                                   child: Center(
                                                     child: Text(
                                                       "Mới",
                                                       style: TextStyle(
                                                           fontSize: 15,
                                                           fontWeight: FontWeight.w500,
                                                           fontStyle: FontStyle.italic
                                                       ),
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(0, 2, 0, 4),
                                                   padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                   height:  double.infinity,
                                                   decoration:  BoxDecoration (
                                                     color:  Color(0xfff3f3e7),
                                                   ),
                                                   child: Text(
                                                     "Tiền mặt",
                                                     style: TextStyle(
                                                         fontSize: 15,
                                                         fontWeight: FontWeight.w500,
                                                         fontStyle: FontStyle.italic
                                                     ),
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(280, 2, 0, 0),
                                                   padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                   child: TextButton(onPressed: (){

                                                   }, child: Image.asset("ic_plus.png",width: 30,height: 30)),
                                                 )
                                               ],
                                             ),
                                           ),
                                           Container(
                                             margin:  EdgeInsets.fromLTRB(1, 0, 0, 0),
                                             width:  500,
                                             child: Column(
                                               crossAxisAlignment:  CrossAxisAlignment.center,
                                               children: [
                                                 Container(
                                                   width: double.infinity,
                                                   child: Row(
                                                     crossAxisAlignment:  CrossAxisAlignment.center,
                                                     children: [
                                                       Container(
                                                         margin:  EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                         child: Text(
                                                           "Điểm lấy: ",
                                                         ),
                                                       ),
                                                       Text("S9.02A, Vinhomes Grand Park, Phường Long Thạnh Mỹ, Quận 9")
                                                     ],
                                                   ),
                                                 ),
                                                 Container(
                                                   margin:  EdgeInsets.fromLTRB(0, 05, 0, 0),
                                                   width: double.infinity,
                                                   child:Column(
                                                     crossAxisAlignment:  CrossAxisAlignment.start,
                                                     children: [
                                                       Container(
                                                         margin:  EdgeInsets.fromLTRB(0, 0, 212, 3),
                                                         width:  double.infinity,
                                                         child: Row(
                                                           crossAxisAlignment:  CrossAxisAlignment.center,
                                                           children: [
                                                             Container(
                                                               margin:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                               child: Text(
                                                                   "Điểm giao: "
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
                               ),

                             ],
                           ),
                         )),
                   ],
                 ),
               )

              ],
            ),
            ),
          ],

        ),

      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );

  }
  void _notifi_menu(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NotifiMenu()));
    Drawer(
      child: HomeMenu(),
    );

  }
  Widget gotoDetail(BuildContext context)
  {
    return orderDetail();
  }
  Widget gotoNotifi(BuildContext context)
  {
    return NotifiMenu();
  }
}