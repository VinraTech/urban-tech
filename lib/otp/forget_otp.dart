import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:i/login/signup/new_password.dart';
import 'package:page_transition/page_transition.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  // immutable Widget
  @override
  Ppp createState() => Ppp();
  // creating State Object of MyWidget
}

class Ppp extends State {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  Future<void> forgetlogin(
    String otp,
  ) async {
    try {
      //
      Response response = await post(
        Uri.parse('https://rbarnsoft.com/henry/api/verify-otp'),
        body: {
          'otp': otp,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.leftToRightWithFade,
            child: NewPassword(
              user_id: data['user_id'],
            ),
            duration: const Duration(seconds: 1),
          ),
        );
        print('otp recieve');
        // ignore: use_build_context_synchronously

      } else {
        Fluttertoast.showToast(msg: 'Eroor');
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
        backgroundColor: const Color.fromARGB(255, 172, 16, 4),
        title: const Text('Otp For Forget Password'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Center(
              //   child: SizedBox(
              //     height: 100.h,
              //     width: 100.w,
              //     child: CircleAvatar(
              //       backgroundImage: const AssetImage('assets/otpscreen.png'),
              //       radius: 50.sp,
              //       backgroundColor: Colors.transparent,
              //     ),
              //   ),
              // ),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Text(
                            'OTP',
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
                          hintText: 'Enter otp',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {},
                        controller: otpController,
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
                                Color.fromARGB(255, 162, 19, 19),
                                Color.fromARGB(255, 148, 9, 9),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.blue, blurRadius: 5),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              forgetlogin(
                                otpController.text,
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
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: const Text('Submit'),
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
