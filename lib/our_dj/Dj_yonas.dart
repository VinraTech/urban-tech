import 'package:flutter/material.dart';
import 'package:i/our_dj/our_dj.dart';
import 'package:page_transition/page_transition.dart';

class DjYonas extends StatefulWidget {
  const DjYonas({super.key});

  @override
  State<DjYonas> createState() => _DjKayozState();
}

class _DjKayozState extends State<DjYonas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DJ Yonas'),
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
            Image.asset('assets/yonas.jpg'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Been in the business for more than 5 years. Used to play in CLUB-X and also ACE of CLUBS nite clubs while they were operational. Crew up listening to RnB, HIP Hob and Reggae mostly but I play pretty much all genre of music to ensure we entertain all sorts of people. You can find me at Edge Marinas nite club mostly weekend when we dont have any Urban Sound gigs you will find me down at there. If you see me at any gig please dont be shy to stop by and say hello Cheers all.',
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
