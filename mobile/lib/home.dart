import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_shipper/models/order.dart';
import 'package:app_shipper/models/infoOrder.dart';
import 'package:app_shipper/components/order_widget.dart';

import 'package:app_shipper/layout/app_bar.dart';
import 'package:app_shipper/layout/drawer.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

Future<List<Order>> fetchOrders() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  final headers = {"Authorization": "Bearer $token"};

  final response = await http.get(
      Uri.parse('https://shipper.thanhtienkr.dev/api/v1.0.0/orders'),
      headers: headers);

  if (response.statusCode == 200) {
    final List<dynamic> orderJsonList = json.decode(response.body)['data'];
    final List<Order> orders =
        orderJsonList.map((json) => Order.fromJson(json)).toList();
    
    return orders;
  } else {
    throw Exception('Failed to load orders');
  }
}

Future<infoOrder> fetchDataInfoOrders() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  final headers = {"Authorization": "Bearer $token"};

  final response = await http.get(
      Uri.parse('https://shipper.thanhtienkr.dev/api/v1.0.0/info-orders'),
      headers: headers);
  if (response.statusCode == 200) {
    final listInfoOrder = json.decode(response.body)['data'];
    
    final infoOrder infoOrders = infoOrder.fromJson(listInfoOrder);
    print(infoOrders);
    return infoOrders;
    
  } else {
    throw Exception('Failed to fetch order data');
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Order>> orders;
  late Future<infoOrder> infoOrders;
  String? selectedValue;

  IO.Socket socket =
      IO.io('https://shipper-socket.thanhtienkr.dev', <String, dynamic>{
    'transports': ['websocket'],
    'debug': true,
  });

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    orders = fetchOrders();
    infoOrders = fetchDataInfoOrders();

    socket.on('shipper_app', (_data) {
      setState(() {
        orders = orders.then((ordersList) {
          final Order order = Order.fromJson(_data);
          ordersList.insert(0, order);
          return ordersList;
        });
      });
    });
  }

  void _runFilter(String enteredKeyword) {
    orders = fetchOrders();
    if (!enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all orders
      orders.then((orderList) {
        List<Order> filteredOrders = orderList
            .where((order) => order.paymentMethod
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        // we use the toLowerCase() method to make it case-insensitive

        // Refresh the UI
        setState(() {
          orders = Future.value(filteredOrders);
        });
      });
    } else {
      // if the search field is empty or only contains white-space, we'll display all orders
      setState(() {
        orders =
            fetchOrders(); // replace with the actual function that fetches the orders
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Text(
                  'Danh sách đơn hàng',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFFF9642),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Tổng đơn:',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: FutureBuilder<infoOrder>(
                              future: infoOrders,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    // get totalOrder from instance infoOrder
                                    'Total Order: ${snapshot.data!.totalOrder}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                            // child: Text(
                            //   '0',
                            //   style: TextStyle(
                            //     fontSize: 16.0,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFFF9642),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Đã thanh toán: ',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Đơn COD:',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                      child: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text('Chuyển khoản'),
                          value: 'banking',
                        ),
                        PopupMenuItem(
                          child: Text('Tiền mặt'),
                          value: 'cod',
                        ),
                      ];
                    },
                    onSelected: (value) {
                      // TODO: Handle dropdown selection

                      _runFilter(value);
                    },
                    child: Row(
                      children: [
                        Text('Lọc '),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.refresh),
                          onPressed: () {
                            // TODO: Handle refresh button press
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: FutureBuilder<List<Order>>(
                      future: orders,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // final List<Order> orders = snapshot.data!;
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final order = snapshot.data![index];
                                return OrderWidget(order: order, page: "home");
                              });
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
