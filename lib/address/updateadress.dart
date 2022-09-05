import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:i/address/getaddress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateAdresswidget extends StatefulWidget {
  const UpdateAdresswidget({Key? key}) : super(key: key);

  // immutable Widget
  @override
  Adresss createState() => Adresss();
  // creating State Object of MyWidget
}

class Adresss extends State {
  final _formKey = GlobalKey<FormState>();
  TextEditingController first_nameController = TextEditingController();
  TextEditingController last_nameController = TextEditingController();
  TextEditingController address_emailController = TextEditingController();
  TextEditingController address_phoneController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController company_nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  Future<void> updateAddress(
      String firstName,
      String lastName,
      String addressEmail,
      String addressPhone,
      String area,
      String companyName,
      String city,
      String state,
      String country,
      String pincode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('logintoken');
      Response response = await post(
        Uri.parse('https://rbarnsoft.com/henry/api/change-address'),
        headers: {"Authorization": 'Bearer $token'},
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'address_email': addressEmail,
          'address_phone': addressPhone,
          'area': area,
          'company_name': companyName,
          'city': city,
          'state': state,
          'country': country,
          'pincode': pincode,
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GetAdresswidget(
              id: const [],
              size: const [],
              count: const [],
              price: const [],
            ),
          ),
        );
        print('Adress submited');
        // ignore: use_build_context_synchronously

      } else {
        Fluttertoast.showToast(msg: 'Eroor');
        print('Response status: ${response.statusCode}');

        print('failed');
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 28, 19),
        title: const Text('Update Address'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Text(
                            'Update Address',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'First Name',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.location_history),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: first_nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Last Name',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.location_history),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: last_nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.mail),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'At least @ characters area.';
                          }
                          return null;
                        },
                        controller: address_emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Number',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: address_phoneController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Area',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.place),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: areaController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'City',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.location_city),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'Invalid city';
                          }
                          return null;
                        },
                        controller: cityController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'State',
                          // icon: Icon(Icons.mail),
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.pin_drop),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'Invalid State';
                          }
                          return null;
                        },
                        controller: stateController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Pin Code',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Pincode error';
                          }
                          return null;
                        },
                        controller: pincodeController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: SizedBox(
                        height: 50.h,
                        width: 250.w,
                        child: ElevatedButton(
                          onPressed: () {
                            updateAddress(
                              first_nameController.text,
                              last_nameController.text,
                              address_emailController.text,
                              address_phoneController.text,
                              areaController.text,
                              company_nameController.text,
                              cityController.text,
                              stateController.text,
                              countryController.text,
                              pincodeController.text,
                            );

                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: const Text('Save Address'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
