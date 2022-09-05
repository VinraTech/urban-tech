// import 'package:flutter/material.dart';
// import 'package:i/our_dj/our_dj.dart';
// import 'package:page_transition/page_transition.dart';

// class DjFillz extends StatefulWidget {
//   const DjFillz({super.key});

//   @override
//   State<DjFillz> createState() => _DjKayozState();
// }

// class _DjKayozState extends State<DjFillz> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DJ Fillz'),
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color.fromARGB(255, 172, 14, 3),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               PageTransition(
//                 type: PageTransitionType.leftToRightWithFade,
//                 child: const OurDJ(),
//                 duration: const Duration(seconds: 1),
//               ),
//             );
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//         child: Column(
//           children: [
//             Image.network(
//               'http://rbarnsoft.com/sagaradmin/uploads/slider-2.png',
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Dj FILLZ Hail from he village of Tulaele. Started playing back in 2004 and clock 15 years of djing experience. Used to play in Crabbers Nite Club back in 2004 to 2011 until they moved to Vaitele. Ive played in weddings, balls, nite clubs, the recent Konkarah Concert where I was invited to be the Guest Dj at Taumeasina Resort.Use to play with some of the famous Djs including Dj Dizzle,  Dj OK,  Dj 2Pua,  Dj Heart You can find me down at Tenamo Nite Club in the heart of Apia on Saturdays.',
//               textAlign: TextAlign.justify,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
