import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Adresswidget extends StatefulWidget {
  const Adresswidget({Key? key}) : super(key: key);

  // immutable Widget
  @override
  Adress createState() => Adress();
  // creating State Object of MyWidget
}

class Adress extends State {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressEmailController = TextEditingController();
  TextEditingController addressPhoneController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController company_nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  Future<void> postAddress(
    String firstName,
    String lastName,
    String addressEmail,
    String addressPhone,
    String area,
    String companyName,
    String city,
    String state,
    String country,
    String pincode,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('logintoken');
      Response response = await post(
        Uri.parse('https://rbarnsoft.com/henry/api/user-address'),
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

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => GetAdresswidget(
        //       price: [],
        //       count: [],
        //       id: const [],
        //       size: const [],
        //     ),
        //   ),
        // );
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
        backgroundColor: const Color.fromARGB(255, 169, 24, 14),
        title: const Text('Billing Details'),
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
                            'Billing Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'First name',

                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.people),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: firstNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Last name',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.gps_fixed),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: lastNameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ADDRESS',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.gps_fixed),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: addressEmailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'PHONE NO',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.gps_fixed),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'At least 4 characters area.';
                          }
                          return null;
                        },
                        controller: addressPhoneController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'AREA',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.gps_fixed),
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
                          hintText: 'CITY',
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
                          hintText: 'ENTER STATE',
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
                          hintText: 'PIN CODE',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.pin),
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
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 220, 44, 44),
                                Color.fromARGB(255, 130, 43, 37),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.yellow, blurRadius: 5),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              postAddress(
                                firstNameController.text,
                                lastNameController.text,
                                addressEmailController.text,
                                addressPhoneController.text,
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent, // background
                                onPrimary: Colors.transparent,
                                shadowColor: Colors.transparent // foreground
                                ),
                            child: const Text(
                              'Save Address',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
