import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UProfile extends StatefulWidget {
  const UProfile({Key? key}) : super(key: key);

  // immutable Widget
  @override
  Updateprofile createState() => Updateprofile();
  // creating State Object of MyWidget
}

class Updateprofile extends State {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phone_noController = TextEditingController();

  Future<void> login(
    String name,
    String email,
    String phoneNo,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('logintoken');
      Response response = await post(
        Uri.parse('http://rbarnsoft.com/henry/api/update-profile'),
        headers: {"Authorization": 'Bearer $token'},
        body: {
          'name': name,
          'email': email,
          'phone_no': phoneNo,
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        // Navigator.pushReplacement(
        //   context,
        //   PageTransition(
        //     type: PageTransitionType.fade,
        //     child: const Getsprofile(),
        //     isIos: true,
        //     duration: const Duration(milliseconds: 400),
        //   ),
        // );

        print('Profile submited');
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
        backgroundColor: const Color.fromARGB(255, 163, 14, 4),
        title: const Text('Update profile'),
        automaticallyImplyLeading: false,
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
                            'Profile update',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 135, 18, 10)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Name',
                          fillColor: Colors.red.withOpacity(0.5),
                          // icon: Icon(Icons.mail),
                          prefixIcon: const Icon(Icons.people),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'At least 2 characters Name.';
                          }
                          return null;
                        },
                        controller: nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'email',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 2) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Phone number',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 9) {
                            return 'Phone Number  error';
                          }
                          return null;
                        },
                        controller: phone_noController,
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
                                Color.fromARGB(255, 112, 3, 3),
                                Color.fromARGB(255, 229, 37, 37),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 243, 201, 104),
                                  blurRadius: 5),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              login(nameController.text, emailController.text,
                                  phone_noController.text);
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
                              'Save profile',
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
