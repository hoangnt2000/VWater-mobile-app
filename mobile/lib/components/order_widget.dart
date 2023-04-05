import 'package:flutter/material.dart';
import 'package:app_shipper/models/order.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:app_shipper/home.dart';
import 'package:app_shipper/detail.dart';
import 'package:app_shipper/received.dart';
import 'package:app_shipper/completed.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  final String page;

  OrderWidget({required this.order, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    order.code + ' ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                    ),
                    child: Text(
                      order.status,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              if (page == "home")
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () async {
                        // Xử lý sự kiện khi người dùng nhấn vào icon
                        final prefs = await SharedPreferences.getInstance();
                        final token = prefs.getString('token');

                        final headers = {"Authorization": "Bearer $token"};

                        final response = await http.post(
                          Uri.parse(
                              'https://shipper.thanhtienkr.dev/api/v1.0.0/orders/${order.id}/pick'),
                          headers: headers,
                        );

                        if (response.statusCode == 200) {
                          // Handle success
                          // ...
                          Fluttertoast.showToast(
                            msg: "Nhận đơn thành công!",
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
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.circle, size: 10),
                            ),
                          ),
                          TextSpan(
                            text: 'Điểm lấy : \t\t\t',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: order.receipt,
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
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.circle, size: 10),
                            ),
                          ),
                          TextSpan(
                            text: 'Cửa hàng : \t\t\t',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: order.shopName,
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
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.circle, size: 10),
                            ),
                          ),
                          TextSpan(
                            text: 'Điểm giao : \t\t\t',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: order.delivery,
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
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.circle, size: 10),
                            ),
                          ),
                          TextSpan(
                            text: 'Ghi chú: \t\t\t',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: order.note,
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
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.circle, size: 10),
                            ),
                          ),
                          TextSpan(
                            text: 'Giờ đặt : \t\t\t',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: order.orderDate,
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
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                // navigation to detail
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(orderId: order.id),
                      ),
                    );
                  },
                  child: Text(
                    'Chi tiết',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse("1C831A", radix: 16) + 0xFF000000),
                    ),
                  ),
                ),
              ),
              if (page == "received" && order.status == "Shipping")
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: TextButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          final token = prefs.getString('token');

                          final headers = {"Authorization": "Bearer $token"};

                          final response = await http.post(
                            Uri.parse(
                                'https://shipper.thanhtienkr.dev/api/v1.0.0/orders/${order.id}/complete'),
                            headers: headers,
                          );

                          if (response.statusCode == 200) {
                            // Handle success
                            // ...
                            Fluttertoast.showToast(
                              msg: "Bạn đã hoàn thành đơn!",
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
                                      OrderCompletedPage()),
                            );
                          } else {
                            // Handle error
                            throw Exception('Failed to pick order');
                          }
                        },
                        child: Text(
                          "Hoàn thành",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3F3E7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          final token = prefs.getString('token');

                          final headers = {"Authorization": "Bearer $token"};

                          final response = await http.post(
                            Uri.parse(
                                'https://shipper.thanhtienkr.dev/api/v1.0.0/orders/${order.id}/cancel'),
                            headers: headers,
                          );

                          if (response.statusCode == 200) {
                            // Handle success
                            // ...
                            Fluttertoast.showToast(
                              msg: "Bạn đã hủy đơn!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
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
                          "Cancel",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}
