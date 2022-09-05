import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i/Provider/profile.dart';
import 'package:i/model/Create_order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulHookConsumerWidget {
  String totalPrice;
  String id;
  String sizee;
  String addressid;
  String price;
  String count;
  String description;
  Payment(
    this.totalPrice,
    this.id,
    this.sizee,
    this.addressid,
    this.price,
    this.count,
    this.description,
  );
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyAppState(
      totalPrice,
      id,
      sizee,
      addressid,
      price,
      count,
      description,
    );
  }
}

class _MyAppState extends ConsumerState<Payment> with TickerProviderStateMixin {
  String totalPrice;
  String id;
  String sizee;
  String addressid;
  String price;
  String count;
  String description;

  _MyAppState(
    this.totalPrice,
    this.id,
    this.sizee,
    this.addressid,
    this.price,
    this.count,
    this.description,
  );
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(profileDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paypal'),
        backgroundColor: const Color.fromARGB(255, 28, 178, 205),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: TextButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => UsePaypal(
                    sandboxMode: true,
                    clientId:
                        "ARuWtg5J13kifpjZ_wsv4xVDnSXs_ywmwgbLnPIJcBbia6nweKKn3EZBCKAIRQZnn7vcVM1pTfogzCJa",
                    secretKey:
                        "EHCvQH3Hmxv0zBpGZRI8zS2JLr0V97py_ZOBTJT4g5ZiA50KL2Q5HEWWSMXsT3vLzrAYRh9PAdJZpCTX",
                    returnURL: "https://samplesite.com/return",
                    cancelURL: "https://samplesite.com/cancel",
                    transactions: [
                      {
                        "amount": {
                          "total": totalPrice.toString(),
                          "currency": "USD",
                          "details": {
                            "subtotal": totalPrice.toString(),
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        // "item_list": {
                        //   "items": [
                        //     {
                        //       "name": "A demo product",
                        //       "quantity": 1,
                        //       "price": '10.12',
                        //       "currency": "USD"
                        //     }
                        //   ],

                        //   // shipping address is not required though
                        //   "shipping_address": {
                        //     "recipient_name": "Jane Foster",
                        //     "line1": "Travis County",
                        //     "line2": "",
                        //     "city": "Austin",
                        //     "country_code": "US",
                        //     "postal_code": "73301",
                        //     "phone": "+00000000",
                        //     "state": "Texas"
                        //   },
                        // }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                    },
                    onCancel: (params) {
                      print('cancelled: $params');
                    }),
              ),
            )
          },
          child: Column(
            children: [
              data.when(
                data: (data) {
                  return GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.1,
                    borderRadius: 0,
                    blur: 7,
                    alignment: Alignment.bottomCenter,
                    border: 0,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color.fromARGB(255, 39, 170, 190).withAlpha(55),
                          const Color(0xFFffffff).withAlpha(45),
                        ],
                        stops: const [
                          0.3,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        const Color(0xFF4579C5).withAlpha(100),
                        const Color(0x0fffffff).withAlpha(55),
                        const Color(0xFFF75035).withAlpha(10),
                      ],
                      stops: const [0.06, 0.95, 1],
                    ),
                    child: Text(
                      "Hello! ${data.user.name}" " Welcome to Paypal Payment",
                    ),
                  );
                  // return Container(
                  //   height: MediaQuery.of(context).size.height * 0.05,
                  //   width: MediaQuery.of(context).size.width * 1,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.blue,
                  //   ),
                  //   child: Text(
                  //     "Hello! ${data.user.name}",
                  //     style: const TextStyle(color: Colors.white),
                  //   ),
                  // );
                },
                error: (err, s) => Text(err.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              ScaleTransition(
                scale: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.paypal_outlined,
                        size: 35,
                      ),
                      Text('Paypal')
                    ],
                  ),
                ),
              ),
              Text('Make a Payment -> T $totalPrice'),
            ],
          ),
        ),
      ),
    );
  }
}

Future<OrderDetail> postOrder(
  String productId,
  String productprice,
  String count,
  String size,
  String transationId,
  String paymentType,
  String amount,
  String paymentStatus,
  String addressId,
  context,
) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('logintoken');
  final response = await http.post(
    Uri.parse('https://rbarnsoft.com/henry/api/create-order'),
    headers: <String, String>{
      "Authorization": 'Bearer $token',
      "Content-Type": 'application/json'
    },
    body: jsonEncode(<String, String>{
      "product_id": productId,
      "product_price": productprice,
      "count": count,
      "size": size,
      "transation_id": transationId,
      "payment_type": paymentType,
      "amount": amount,
      "payment_status": paymentStatus,
      "address_id": addressId,
    }),
  );
  print('ProductID:- $productId');
  print('Productprice:- $productprice');
  print('count:- $count');
  print('size:- $size');
  print('transationId:- $transationId');
  print('paymentType:- $paymentType');
  print('amount:- $amount');
  print('paymentStatus:- $paymentStatus');
  print('addressId:- $addressId');
  print(response.statusCode);
  print(response.request);
  Fluttertoast.showToast(
      msg:
          "SUCCESS: $productId productprice $productprice count $count size $size transationId $transationId paymentType $paymentType amount $amount paymentStatus $paymentStatus addressId $addressId",
      toastLength: Toast.LENGTH_LONG);
  if (response.statusCode == 200) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const ThankYouPage(
    //       title: 'Home',
    //     ),
    //   ),
    // );

    return OrderDetail.fromJson(jsonDecode(response.body));
  } else {
    // then throw an exception.
    throw Exception('Failed to create order');
  }
}
