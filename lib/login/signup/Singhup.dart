import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:i/otp/signupotp.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';

class Singhup extends StatefulWidget {
  const Singhup({Key? key}) : super(key: key);

  // immutable Widget
  @override
  Screen1 createState() => Screen1();
  // creating State Object of MyWidget
}

class Screen1 extends State {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phone_noController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmController = TextEditingController();
  Future<void> login(
      String name, String email, String phoneNo, String password) async {
    try {
      // Obtain shared preferences.
      Response response = await post(
        Uri.parse('https://rbarnsoft.com/henry/api/signup'),
        body: {
          'name': name,
          'email': email,
          'phone_no': phoneNo,
          'password': password,
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(
          response.body.toString(),
        );
        // print(data['token']);
        Fluttertoast.showToast(msg: 'success');
        print('Singhup succefully');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            child: const EnterCode(),
            duration: const Duration(seconds: 2),
          ),
        );
        //
      } else {
        Fluttertoast.showToast(
          msg: 'Phonenumber and Email already taken',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                            'Continue to Sing Up!',
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
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: const Text('Name'),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
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
                                  controller: nameController,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: const Text('Email'),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
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
                                    if (value!.isEmpty || value.length < 3) {
                                      return '@';
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
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: const Text('Phone Number'),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
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
                                    prefixIcon: const Icon(Icons.phone),
                                  ),
                                  onFieldSubmitted: (value) {},
                                  controller: phone_noController,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: const Text('Password'),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
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
                                    prefixIcon: const Icon(Icons.lock),
                                  ),
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 8) {
                                      return 'password be lest 8 Character';
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
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
                                        color:
                                            Color.fromARGB(255, 227, 249, 170),
                                        blurRadius: 10),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      login(
                                        nameController.text,
                                        emailController.text,
                                        phone_noController.text,
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
                                    onSurface: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: const Text('Sing up'),
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
                              const Text('Already have a account?'),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent, // background
                                      onPrimary: Colors.transparent,
                                      shadowColor:
                                          Colors.transparent // foreground
                                      ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        child: const MyWidget(),
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
          ],
        ),
      ),
    );
  }
}


//                         
//                           Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text('NAME'),
//                                 const SizedBox(
//                                   height: 3,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           width: 0, color: Colors.white),
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     fillColor:
//                                         const Color.fromARGB(255, 197, 197, 197)
//                                             .withOpacity(0.5),
//                                     filled: true,
//                                     border: const OutlineInputBorder(),

//                                     // icon: Icon(Icons.mail),
//                                     prefixIcon: const Icon(Icons.people),
//                                   ),
//                               
//                                 const SizedBox(
//                                   height: 7,
//                                 ),
//                                 const Text('Email'),
//                                 const SizedBox(
//                                   height: 3,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           width: 0, color: Colors.white),
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     fillColor:
//                                         const Color.fromARGB(255, 197, 197, 197)
//                                             .withOpacity(0.5),
//                                     filled: true,
//                                     border: const OutlineInputBorder(),

//                                     // icon: Icon(Icons.mail),
//                                     prefixIcon: const Icon(Icons.email),
//                                   ),
//                                   onFieldSubmitted: (value) {},
//                                   validator: (value) {
//                                     if (value!.isEmpty || value.length < 9) {
//                                       return 'Number should be atleast 10 digit';
//                                     }
//                                     return null;
//                                   },
//                                   controller: emailController,
//                                 ),
//                                 const SizedBox(
//                                   height: 7,
//                                 ),
//                                 const Text('Phone No'),
//                                 const SizedBox(
//                                   height: 3,
//                                 ),
//                                 TextFormField(
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           width: 0, color: Colors.white),
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     fillColor:
//                                         const Color.fromARGB(255, 197, 197, 197)
//                                             .withOpacity(0.5),
//                                     filled: true,
//                                     border: const OutlineInputBorder(),

//                                     // icon: Icon(Icons.mail),
//                                     prefixIcon: const Icon(Icons.phone),
//                                   ),
//                                   onFieldSubmitted: (value) {},
//                                   validator: (value) {
//                                     if (value!.isEmpty || value.length < 9) {
//                                       return 'Phone Number is wrong';
//                                     }
//                                     return null;
//                                   },
//                                   controller: phone_noController,
//                                 ),
//                                 const SizedBox(
//                                   height: 7,
//                                 ),
//                                 const Text('Password'),
//                                 const SizedBox(
//                                   height: 3,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           width: 0, color: Colors.white),
//                                       borderRadius: BorderRadius.circular(15),
//                                     ),
//                                     fillColor:
//                                         const Color.fromARGB(255, 197, 197, 197)
//                                             .withOpacity(0.5),
//                                     filled: true,
//                                     border: const OutlineInputBorder(),

//                                     // icon: Icon(Icons.mail),
//                                     prefixIcon: const Icon(Icons.lock),
//                                   ),
//                                   onFieldSubmitted: (value) {},
//                                   validator: (value) {
//                                     if (value!.isEmpty || value.length < 8) {
//                                       return 'password be lest 8 Character';
//                                     }
//                                     return null;
//                                   },
//                                   controller: passwordController,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: SizedBox(
//                     height: 50,
//                     width: 250,
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [
//                             Color.fromARGB(255, 241, 151, 151),
//                             Color.fromARGB(255, 240, 73, 73),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(5),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Color.fromARGB(255, 227, 249, 170),
//                               blurRadius: 10),
//                         ],
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             login(
//                               nameController.text,
//                               emailController.text,
//                               phone_noController.text,
//                               passwordController.text,
//                             );
//                             if (_formKey.currentState!.validate()) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                     'checking.......',
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   backgroundColor: Colors.white,
//                                   duration: Duration(seconds: 1),
//                                 ),
//                               );
//                             }
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.transparent,
//                           onSurface: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                         ),
//                         child: const Text('Sing up'),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Row(
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Already have a account?'),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.transparent, // background
//                               onPrimary: Colors.transparent,
//                               shadowColor: Colors.transparent // foreground
//                               ),
//                           child: const Text(
//                             'Login',
//                             style: TextStyle(color: Colors.red),
//                           ),
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               PageTransition(
//                                 type: PageTransitionType.rightToLeftWithFade,
//                                 child: const MyWidget(),
//                                 duration: const Duration(seconds: 2),
//                               ),
//                             );
//                           }),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
