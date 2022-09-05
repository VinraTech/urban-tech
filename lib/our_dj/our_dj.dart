import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i/mainpage/getallproduct.dart';
import 'package:i/our_dj/DJ_Chala.dart';
import 'package:i/our_dj/DJ_Kayoz.dart';
import 'package:i/our_dj/Dj_yonas.dart';
import 'package:page_transition/page_transition.dart';

class OurDJ extends StatefulWidget {
  const OurDJ({Key? key}) : super(key: key);

  @override
  State<OurDJ> createState() => _BodyState();
}

class _BodyState extends State<OurDJ> with SingleTickerProviderStateMixin {
  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 3000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 174, 23, 12),
        shadowColor: const Color.fromARGB(255, 140, 22, 14),
        title: const Text(
          "Our DJS",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.leftToRightWithFade,
                child: const Body(),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: const Color.fromARGB(255, 152, 23, 14),
        strokeWidth: 4.0,
        onRefresh: () async {
          // Replace this delay with the code to be executed during refresh
          // and return a Future when code finishs execution.
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: const DjKayoz(),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/kyoz.jpg',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        const Center(
                          child: Text(
                            "DJ KAYOZ",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: const DjChala(),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/chalas.jpg'),
                        SizedBox(
                          height: 8.h,
                        ),
                        const Center(
                          child: Text(
                            "DJ CHALA",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: const DjYonas(),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/yona.jpg'),
                        SizedBox(
                          height: 8.h,
                        ),
                        const Center(
                          child: Text(
                            "DJ YONAS",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
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
