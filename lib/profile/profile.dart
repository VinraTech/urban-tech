import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:i/Provider/profile.dart';
import 'package:i/login/signup/login.dart';
import 'package:i/mainpage/getallproduct.dart';
import 'package:i/model/profilemodel.dart';
import 'package:i/profile/updateprofile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getsprofile extends HookConsumerWidget {
  const Getsprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // final profileImage = ref.watch(profilePicProvider(false));
    final data = ref.watch(profileDataProvider);
    final profile = useState<Profile?>(null);
    useEffect(() {
      ref.refresh(profileDataProvider);
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 137, 19, 11),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.leftToRightJoined,
                child: const Body(),
                childCurrent: this,
                duration: const Duration(milliseconds: 555),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: Stack(
          children: [
            ListView(
              children: [
                data.when(
                  data: (data) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if (profile.value != data) {}
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const UProfile(),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            child: const Center(
                                              child: Text(
                                                'Edit My Profile ',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 110, 109, 109),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child: Icon(
                                                  Icons.people,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  data.user.name.toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 108, 107, 107),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  data.user.phoneNo.toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 108, 107, 107),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.0),
                                                child: Icon(
                                                  Icons.email,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  data.user.email.toString(),
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 108, 107, 107),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                      child: Row(
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              SharedPreferences preferences =
                                                  await SharedPreferences
                                                      .getInstance();
                                              await preferences
                                                  .remove('logintoken');
                                              Navigator.pushReplacement(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .rightToLeftWithFade,
                                                  child: const MyWidget(),
                                                  duration: const Duration(
                                                      seconds: 2),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.logout_rounded,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  'Logout',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  error: (err, s) => Text(err.toString()),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
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




// Center(
//                                         child: SizedBox(
//                                           height: 60,
//                                           width: 170,
//                                           child: ElevatedButton(
//                                             onPressed: () async {
//                                               SharedPreferences preferences =
//                                                   await SharedPreferences
//                                                       .getInstance();
//                                               await preferences
//                                                   .remove('logintoken');
//                                               // Navigator.pushReplacement(
//                                               //   context,
//                                               //   PageTransition(
//                                               //     type: PageTransitionType
//                                               //         .rightToLeftWithFade,
//                                               //     child: const MyWidget(),
//                                               //     duration: const Duration(
//                                               //         seconds: 2),
//                                               //   ),
//                                               // );
//                                             },
//                                             child: const Text('Logout'),
//                                           ),
//                                         ),
//                                       )








                                      // Padding(
                                      //   padding: EdgeInsets.only(left: 20.w),
                                      //   child: Text(data.user.name),
                                      // ),
                                      // const Divider(),
                                      // SizedBox(
                                      //   child: Padding(
                                      //     padding: EdgeInsets.only(
                                      //       left: 10.w,
                                      //     ),
                                      //     child: const Text(
                                      //       'Phone no.',
                                      //       style:
                                      //           TextStyle(color: Colors.grey),
                                      //     ),

                                      //     // ${data.user.name},\n${data.user.phoneNo},\n${data.user.email}'
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(left: 20.w),
                                      //   child: Text(data.user.phoneNo),
                                      // ),
                                      // const Divider(),
                                      // SizedBox(
                                      //   child: Padding(
                                      //     padding: EdgeInsets.only(
                                      //       left: 10.w,
                                      //     ),
                                      //     child: const Text(
                                      //       'Email',
                                      //       style:
                                      //           TextStyle(color: Colors.grey),
                                      //     ),

                                      //     // ${data.user.name},\n${data.user.phoneNo},\n${data.user.email}'
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(left: 20.w),
                                      //   child: Text(data.user.email),
                                      // ),
                                      // const Divider(),