import 'package:flutter/material.dart';
import 'package:i/our_dj/our_dj.dart';
import 'package:page_transition/page_transition.dart';

class DjKayoz extends StatefulWidget {
  const DjKayoz({super.key});

  @override
  State<DjKayoz> createState() => _DjKayozState();
}

class _DjKayozState extends State<DjKayoz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DJ Kayoz'),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 172, 14, 3),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.leftToRightWithFade,
                child: const OurDJ(),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
        child: Column(
          children: [
            Image.asset('assets/kyoz.jpg'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Started djing when I was 16 years old. Been inspired by alot of Islanders dj like Dj Ticklez and Peter Guns from Fresh of the Boat mix tape been released during the early 2000s. Been with Urban Sound since 2013 and I have gained diverse experience due to the corporate events we have been involved and have played with. From corporate evetns to balls, to nite clubs, overseas wedding at several resorts to name a few. Well versed with selection to entertain all sorts of people from young to old you name it. You plan you event and I will ensure that your event will be memorable. You can meet me down at Tenamo',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
