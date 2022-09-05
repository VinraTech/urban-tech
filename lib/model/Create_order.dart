// To parse this JSON data, do
//
//     final orderDetail = orderDetailFromJson(jsonString);

import 'dart:convert';

OrderDetail orderDetailFromJson(String str) =>
    OrderDetail.fromJson(json.decode(str));

String orderDetailToJson(OrderDetail data) => json.encode(data.toJson());

class OrderDetail {
  OrderDetail({
  required  this.status,
   required this.order,
  });

  String status;
  Order order;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        status: json["status"],
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order": order.toJson(),
      };
}

class Order {
  Order({
    required this.orderId,
    required this.customerId,
    required this.quentity,
    required this.transationId,
    required this.paymentType,
    required this.amount,
    required this.paymentStatus,
    required this.orderDate,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String orderId;
  int customerId;
  int quentity;
  String transationId;
  String paymentType;
  String amount;
  String paymentStatus;
  DateTime orderDate;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        customerId: json["customer_id"],
        quentity: json["quentity"],
        transationId: json["transation_id"],
        paymentType: json["payment_type"],
        amount: json["amount"],
        paymentStatus: json["payment_status"],
        orderDate: DateTime.parse(json["order_date"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "customer_id": customerId,
        "quentity": quentity,
        "transation_id": transationId,
        "payment_type": paymentType,
        "amount": amount,
        "payment_status": paymentStatus,
        "order_date":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
