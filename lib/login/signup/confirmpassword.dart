import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Confirmpassword extends StatefulWidget {
  const Confirmpassword({Key? key}) : super(key: key);

  // immutable Widget
  @override
  Screen1 createState() => Screen1();
  // creating State Object of MyWidget
}

class Screen1 extends State {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController phone_noController = TextEditingController();

  Future<void> forget(String phoneNoNumber) async {
    try {
      // Obtain shared preferences.
      final prefs = await SharedPreferences.getInstance();
      Response response = await post(
        Uri.parse(''),
        body: {
          'phone_no': phoneNoNumber,
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        // print(data['token']);
        MotionToast.success(
          description: const Text('success'),
          title: const Text('success'),
        ).show(context);
        print('');
        // ignore: use_build_context_synchronously
        // Navigator.pushReplacement(
        //   context,
        //   PageTransition(
        //     type: PageTransitionType.rightToLeftWithFade,
        //     child: const Forgetotp(),
        //     duration: const Duration(seconds: 2),
        //   ),
        // );
      } else {
        MotionToast.success(
          description: const Text('Failed'),
          title: const Text('Failed'),
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
      appBar: AppBar(
        title: const Text('Reset Password'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: const Color.fromARGB(255, 135, 14, 5),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Set the new password for your account so you can login and access all the features',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),

                    // icon: Icon(Icons.mail),
                  ),
                  onFieldSubmitted: (value) {},
                  validator: (value) {
                    if (value!.isEmpty || value.length <= 4) {
                      return 'Incorrect email';
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
                          Color.fromARGB(255, 244, 126, 126),
                          Color.fromARGB(255, 248, 63, 63),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 244, 235, 138),
                            blurRadius: 5),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          forget(
                            phone_noController.text,
                          );
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
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
                        onSurface: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text('Continue'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
