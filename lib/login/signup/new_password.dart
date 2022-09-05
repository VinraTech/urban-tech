import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';

class NewPassword extends StatefulWidget {
  final String user_id;
  const NewPassword({Key? key, required this.user_id}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewmobieState();
}

class _NewmobieState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController new_passwordController = TextEditingController();
  TextEditingController confirm_passwordController = TextEditingController();
  Future<void> newPass(String newPassword, String confirmPassword) async {
    try {
      // Obtain shared preferences.

      Response response = await post(
        Uri.parse(
            'https://rbarnsoft.com/henry/api/reset-password/${widget.user_id}'),
        body: {
          'new_password': newPassword,
          'confirm_password': confirmPassword,
        },
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );

        Fluttertoast.showToast(msg: 'Updated Successfully');
        print('new  paasword');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            child: const MyWidget(),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Password are not match',
          timeInSecForIosWeb: 1,
        );

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
        backgroundColor: const Color.fromARGB(255, 152, 14, 4),
        title: const Text('Update password'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'New Password',
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return 'Password should be at least 8';
                          }
                          return null;
                        },
                        controller: new_passwordController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Confirm Password',

                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return 'Password should be at least 8';
                          }
                          if (new_passwordController ==
                              confirm_passwordController.text) {}
                          return null;
                        },
                        controller: confirm_passwordController,
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
                                Color.fromARGB(255, 117, 13, 13),
                                Color.fromARGB(255, 144, 17, 17),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.blue, blurRadius: 5),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                newPass(
                                  new_passwordController.text,
                                  confirm_passwordController.text,
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
                            child: const Text('Change'),
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
