import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:i/About_us/About_us.dart';
import 'package:i/Shop_online/Shoponline.dart';
import 'package:i/contact/contact_us.dart';
import 'package:i/our_dj/our_dj.dart';
import 'package:i/profile/profile.dart';
import 'package:page_transition/page_transition.dart';

import '../Allimages/getallimages.dart';

const Color p = Color(0xff416d69);

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    value: -1.0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TwoPanels(
        controller: controller,
      ),
    );
  }
}

class TwoPanels extends StatefulWidget {
  final AnimationController controller;

  const TwoPanels({Key? key, required this.controller}) : super(key: key);

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> with TickerProviderStateMixin {
  static const _headerHeight = 32.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height - _headerHeight;
    const frontPanelHeight = -_headerHeight;

    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        backPanelHeight,
        0.0,
        frontPanelHeight,
      ),
      end: const RelativeRect.fromLTRB(0.0, 100, 0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.linear),
    );
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 174, 23, 12),
            shadowColor: const Color.fromARGB(255, 140, 22, 14),
            title: const Text(
              "Backdrop",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Getsprofile(),
                    ),
                  );
                },
                icon: const Icon(Icons.people),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .48,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const AboutUs(),
                                  duration: const Duration(milliseconds: 555),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/abooutus.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text(
                                    'About us',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .47,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: const Duration(milliseconds: 555),
                                  type: PageTransitionType.fade,
                                  child: const Getimages(),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/gall.avif',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text(
                                    'Galleries',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          // image: DecorationImage(
                          //     image: AssetImage("assets/bg.png"),
                          //     fit: BoxFit.fitHeight),

                          ),
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .47,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: ContactUspage(),
                                  duration: const Duration(milliseconds: 555),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/contact.avif',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .47,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: const Duration(seconds: 1),
                                  type: PageTransitionType.fade,
                                  child: const Getimages(),
                                ),
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                // Shoponline
                                Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    duration: const Duration(milliseconds: 555),
                                    type: PageTransitionType.fade,
                                    child: const Shoponline(),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 8,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/shop.avif',
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    const Text(
                                      'Shop online',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          // image: DecorationImage(
                          //     image: AssetImage("assets/bg.png"),
                          //     fit: BoxFit.fitHeight),

                          ),
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .45,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: const Duration(milliseconds: 555),
                                  type: PageTransitionType.fade,
                                  child: const OurDJ(),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 8,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/dj.avif',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text(
                                    'Our Dj',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //       // image: DecorationImage(
                    //       //     image: AssetImage("assets/bg.png"),
                    //       //     fit: BoxFit.fitHeight),

                    //       ),
                    //   height: MediaQuery.of(context).size.height * .2,
                    //   width: MediaQuery.of(context).size.width * .3,
                    //   child: Column(
                    //     children: [
                    //       Card(
                    //         elevation: 8,
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               'assets/about.png',
                    //               fit: BoxFit.cover,
                    //             ),
                    //             SizedBox(
                    //               height: 10.h,
                    //             ),
                    //             const Text(
                    //               'Videos',
                    //               style: TextStyle(
                    //                 color: Colors.black,
                    //                 fontSize: 18,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // PositionedTransition(
        //   rect: getPanelAnimation(constraints),
        //   child: Material(
        //     elevation: 12.0,
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(16.0),
        //       topRight: Radius.circular(16.0),
        //     ),
        //     child: Column(
        //       children: const <Widget>[
        //         // SizedBox(
        //         //   height: _headerHeight,
        //         //   child: Center(
        //         //     child: Text(
        //         //       "Shop Here",
        //         //       style: Theme.of(context).textTheme.button,
        //         //     ),
        //         //   ),
        //         // ),
        //         // Expanded(
        //         //   child: Center(
        //         //     child: Text(
        //         //       "Add to cart",
        //         //       style: TextStyle(fontSize: 24.0, color: Colors.black),
        //         //     ),
        //         //   ),
        //         // )
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}
