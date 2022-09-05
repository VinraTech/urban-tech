import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

import '../login/signup/Singhup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.blue,
        skipCallback: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Skip clicked",
              style: TextStyle(color: Colors.black),
            ),
          ));
        },
        finishCallback: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Singhup(),
            ),
          );
        },
      ),
    );
  }

  final pages = [
    PageModel.withChild(
        child: Column(
          children: [
            Image.asset(
              'assets/Vector.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'WELCOME TO URBAN TECH',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'URBANSOUND is a dynamic company which provides Sound System Reinforcement and Mobile DJ services. With a renowned reputation as one of Samoas leading entertainment company , UrbandSound caters for a wide variety of events /functions such as concerts, weddings, birthdays, parties, music awards, conference and the like. The services we provide range depending on the occasion or the needs of the clients catering for small to big occasions',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
        color: const Color(0xFF5886d6),
        doAnimateChild: true),
    PageModel.withChild(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Vector1.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Center(
              child: Text(
                'WELCOME TO URBAN TECH',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'No matter what the event, we have the gears and the expertise to make your function a success. We Have provided Full Sound System for Below Events We Have provided Full Sound System for Below Events - Youth Commonwealth 2015 - Stan Walker Concert - Craigs Compound - 2018 - Eddie James Concert - GYM 1 2019 - Prophet Nelson Visti to Samoa - 2019 - Small Islands Developing States Openning - Faleata Complex - 2014 - Savages Concert - GYM 1 - 2009 - Mat Catinghub - Taumesina Resort 2019',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
        color: const Color.fromARGB(255, 238, 167, 236),
        doAnimateChild: true),
    PageModel.withChild(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Vector2.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Center(
              child: Text(
                'WELCOME TO URBAN TECH',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Brown Hill Concert - Taumesina Resort 2019 - DTP Concert - Taumesina Resort 2009 - Justin Wellington - Tanoa Hotel 2019 - Annie Grace - Infront of Government Building 2067 - LIFE CON - Fashion Show 2018/2019 - Pacific Tuna Conference - Faleata Complex 2014 - SJ Demarco & Danger Boy - Laughing With Samoa - GYM 1 2010 - Marina Davis - Miss SFA 2006 - 2019 - Miss Samoa - 2016 & 2017 - Jazz & Blues Festival - Hotel Mellenia 2010 - Billy TK Junior - STA Fale 2010 - Bands from the US - Opeloges Jazz - Tanoa Tusitala 2008 - Teuila Festival - 2009  2014 - Samoan Star Search - Samoa Hip Hop - Local Bands to name a few',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
        color: const Color.fromARGB(255, 239, 150, 150),
        doAnimateChild: true),
  ];
}
