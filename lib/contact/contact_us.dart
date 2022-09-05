import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class ContactUspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 172, 14, 3),
          title: const Text('contact us'),
        ),
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'UrbanTech',
          textColor: Colors.black,
          backgroundColor: Colors.white,
          email: 'info@urbansound.ws',
          // textFont: 'Sail',
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ContactUs(
              cardColor: const Color.fromARGB(255, 197, 178, 178),
              textColor: Colors.teal.shade900,
              logo: const AssetImage('assets/splash.png'),
              email: 'info@urbansound.ws',
              companyName: 'Urban-tech',
              companyColor: Colors.teal.shade100,
              dividerThickness: 2,
              phoneNumber: '685-7762955',
              website: 'https://www.urbansound.ws/',
              tagLine: "DJ'S",
              instagram: 'urbansound.samoa',
              taglineColor: Colors.teal.shade100,
              facebookHandle: 'URBANSOUND',
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Hours: 8AM - 9PM',
              style: TextStyle(color: Colors.black, fontSize: 22),
            )
          ],
        ));
  }
}
