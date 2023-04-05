import 'package:flutter/material.dart';
import 'package:app_shipper/received.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderId {
  final int id;
  OrderId(this.id);
}

class DetailPage extends StatefulWidget {
  final int orderId;

  DetailPage({required this.orderId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic>? _orderData;

  @override
  void initState() {
    super.initState();
    fetchOrderData();
  }

  Future<void> fetchOrderData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final headers = {"Authorization": "Bearer $token"};

    final response = await http.get(
        Uri.parse(
            'https://shipper.thanhtienkr.dev/api/v1.0.0/orders/${widget?.orderId}'),
        headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        _orderData = jsonDecode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to fetch order data');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_orderData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      // Nút back
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_orderData!['code']}',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            // Badge trạng thái đã thanh toán
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      // Icon thông báo
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // Các widget khác ở đây
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 18),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: Colors.green,
                                              size: 24,
                                            ),
                                            SizedBox(width: 16),
                                            Text(
                                              'Thông tin đơn hàng \t\t',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Inter',
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Tổng tiền thu hộ:  ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${_orderData!['price']} VND',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text.rich(
                                        TextSpan(children: [
                                          TextSpan(
                                            text: 'Trạng thái đơn:  \t\t',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          TextSpan(
                                              text: '${_orderData!['status']}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Inter',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff23C71F),
                                              )),
                                        ]),
                                      ),
                                      SizedBox(height: 6),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Ghi chú: \t\t',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: _orderData!['notes'] ?? '',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 18),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: Colors.green,
                                              size: 24,
                                            ),
                                            SizedBox(width: 16),
                                            Text(
                                              'Thông tin lấy hàng',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Inter',
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Điểm lấy: \t\t ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${_orderData!['receipt']}',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'SDT cửa hàng: \t\t',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: _orderData!['shop_phone'] ??
                                                  '',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Thời gian đặt: \t\t',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: _orderData!['order_date'] ??
                                                  '',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 18),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: Colors.green,
                                              size: 24,
                                            ),
                                            SizedBox(width: 16),
                                            Text(
                                              'Thông tin giao hàng',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: 'Inter',
                                                fontStyle: FontStyle.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Người nhận: \t\t ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${_orderData!['delivery']}',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Điểm giao:  \t\t',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                                text:
                                                    '${_orderData!['delivery']}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Inter',
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'SDT: \t\t',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${_orderData!['shop_phone']}',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Ghi chú:  \t\t',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: _orderData!['notes'] ?? '',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_orderData!['status'] == "Confirm")
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: TextButton(
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                final token = prefs.getString('token');

                                final headers = {
                                  "Authorization": "Bearer $token"
                                };

                                final response = await http.post(
                                  Uri.parse(
                                      'https://shipper.thanhtienkr.dev/api/v1.0.0/orders/${_orderData!['id']}/shipping'),
                                  headers: headers,
                                );

                                if (response.statusCode == 200) {
                                  // Handle success
                                  // ...
                                  Fluttertoast.showToast(
                                    msg: "Đã lấy hàng thành công!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            OrderReceivedPage()),
                                  );
                                } else {
                                  // Handle error
                                  throw Exception('Failed to pick order');
                                }
                              },
                              child: Text(
                                "Đã lấy hàng",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                      ],
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
}
