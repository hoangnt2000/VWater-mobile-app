class Order {
  final int id;
  final String code;
  final String paymentMethod;
  final String receipt;
  final String delivery;
  final String shopName;
  final String note;
  final String status;
  final String title;
  final String createdAt;
  final String orderDate;

  Order({
    required this.id,
    required this.code,
    required this.paymentMethod,
    required this.status,
    required this.receipt,
    required this.delivery,
    required this.shopName,
    required this.note,
    required this.title,
    required this.createdAt,
    required this.orderDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      status: json['status'] ?? '',
      receipt: json['receipt'] ?? '',
      delivery: json['delivery'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
      shopName: json['shop_name'] ?? '',
      note: json['notes'] ?? '',
      title: json['title'] ?? '',
      createdAt: json['created_at'] ?? '',
      orderDate: json['order_date'] ?? '',
    );
  }
}
