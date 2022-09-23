import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:http/http.dart';
import 'package:i/login/signup/Forget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mainpage/getallproduct.dart';
import 'Singhup.dart';

// import 'forget_password.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  // immutable Widget
  @override
  Screen1 createState() => Screen1();
  // creating State Object of MyWidget
}

class Screen1 extends State {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(String email, String password) async {
    try {
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      Response response = await post(
        Uri.parse('https://rbarnsoft.com/henry/api/signin'),
        body: {
          'email': email,
          'password': password,
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        print(data['token']);
        await prefs.setString('logintoken', data['access_token']);
        MotionToast.success(
          description: const Text('success'),
          title: const Text('welcome'),
        ).show(context);
        print('login succefully');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: const Body(),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        MotionToast.warning(
          description: const Text('Email and password does not match'),
          title: const Text('Warning'),
        ).show(context);

        print("The Error meaasage is:${response.body}");
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
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Stack(
            children: [
              Container(
                height: 590.h,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 174, 28, 17),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 480.h,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 254, 254, 254),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, top: 12.h),
                        child: const Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, top: 5.h),
                        child: const Text(
                          'Continue to Login!',
                          style: TextStyle(fontSize: 17, color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: const Text('EMAIL'),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0, color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fillColor:
                                      const Color.fromARGB(255, 197, 197, 197)
                                          .withOpacity(0.5),
                                  filled: true,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.people),
                                ),
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 2) {
                                    return 'At least 2 characters name.';
                                  }
                                  return null;
                                },
                                controller: emailController,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: const Text('PASSWORD'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0, color: Colors.white),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fillColor:
                                      const Color.fromARGB(255, 197, 197, 197)
                                          .withOpacity(0.5),
                                  filled: true,
                                  border: const OutlineInputBorder(),

                                  // icon: Icon(Icons.mail),
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 8) {
                                    return 'Password should be atleast 8 character';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const Forgot_Password(),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                              style:
                              ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: Colors.transparent,
                                  shadowColor: Colors.transparent // foreground
                                  );
                            },
                            child: const Text(
                              'Forget password',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: SizedBox(
                            height: 45.h,
                            width: 245.w,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 241, 151, 151),
                                    Color.fromARGB(255, 240, 73, 73),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 227, 249, 170),
                                      blurRadius: 10),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    login(
                                      emailController.text,
                                      passwordController.text,
                                    );
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'checking.......',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          backgroundColor: Colors.white,
                                          duration: Duration(seconds: 1),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onSurface:
                                      Colors.transparent.withOpacity(0.38),
                                  shadowColor: Colors.transparent,
                                ),
                                child: const Text('Login'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Dont have a account?'),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onPrimary: Colors.transparent,
                                    shadowColor:
                                        Colors.transparent // foreground
                                    ),
                                child: const Text(
                                  'Signup',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const Singhup(),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
