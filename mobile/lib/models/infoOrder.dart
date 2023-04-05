class infoOrder {
  final String totalOrder;
  final String totalOrderCompleted;
  final String totalOrderConfirm;
  final String totalOrderShipping;
  final String totalOrderFinish;
  final String totalMoney;

  infoOrder({
    required this.totalOrder,
    required this.totalOrderCompleted,
    required this.totalOrderConfirm,
    required this.totalOrderShipping,
    required this.totalOrderFinish,
    required this.totalMoney,
  });

  factory infoOrder.fromJson(Map<String, dynamic> json) {
   
    return infoOrder(
      totalOrder: json['total_orders'] ?? '',
      totalOrderCompleted: json['total_orders_completed'] ?? '',
      totalOrderConfirm: json['total_orders_confirm'] ?? '',
      totalOrderShipping: json['total_orders_shipping'] ?? '',
      totalOrderFinish: json['total_orders_finish'] ?? '',
      totalMoney: json['total_money'] ?? '',
    );
  }
}
