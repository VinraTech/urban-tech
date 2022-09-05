import 'package:flutter/material.dart';
import 'package:i/our_dj/our_dj.dart';
import 'package:page_transition/page_transition.dart';

class DjChala extends StatefulWidget {
  const DjChala({super.key});

  @override
  State<DjChala> createState() => _DjKayozState();
}

class _DjKayozState extends State<DjChala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DJ Chala'),
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
            Image.asset(
              'assets/chala.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Local island DJ/Re-mixer from the beautiful island of Samoa. Making music for those who love music like myself  Reggae | Dancehall | Hip Hop | RnB | Reggaeton | Rhythm and Blues | Tropical House | Trap.Im currently playing at Tenamos Nite Club every Fridays. I have more than 8 years of Djing Experience and played in almost every event such as school balls, birthdays, weddings, parties you name it.IT by profession but Djing on the side.',
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
