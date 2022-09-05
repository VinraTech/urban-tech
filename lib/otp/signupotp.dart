import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:screen_utils/screen_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:i/login/signup/login.dart';
import 'package:motion_toast/motion_toast.dart';

class EnterCode extends StatefulWidget {
  const EnterCode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OTP();
  // creating State Object of MyWidget
}

class OTP extends State<EnterCode> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  Future<void> login(
    String otp,
  ) async {
    try {
      Response response = await post(
        Uri.parse('https://rbarnsoft.com/henry/api/verify-email'),
        body: {
          'otp': otp,
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyWidget(),
          ),
        );
        print('otp recieve');
      } else {
        MotionToast.warning(
          description: const Text('Warning'),
          title: const Text('Eroor'),
        ).show(context);
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
        backgroundColor: const Color.fromARGB(255, 174, 18, 7),
        title: const Text('OTP'),
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
                                Color.fromARGB(255, 131, 14, 14),
                                Color.fromARGB(255, 119, 7, 7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 243, 220, 148),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              login(
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
