import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _DjKayozState();
}

class _DjKayozState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(255, 172, 14, 3),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Column(
              children: [
                Image.asset('assets/abooutus.jpg'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'URBANSOUND is a dynamic company which provides Sound System Reinforcement and Mobile DJ services. With a renowned reputation as one of Samoas leading entertainment company , UrbandSound caters for a wide variety of events /functions such as concerts, weddings, birthdays, parties, music awards, conference and the like.  The services we provide range depending on the occasion or the needs of the clients catering for small to big occasions. No matter what the event, we have the gears and the expertise to make your function a success. We Have provided Full Sound System for Below Events We Have provided Full Sound System for Below Events \n–Youth Commonwealth 2015 – APIA PARK 2015 \n– Stan Walker Concert – Craigs Compound – 2018 \n– Ardijah – GYM 1 Faleata \n– Punialavaa, Poetik, Iakopo, Annie Crummer, Raze, Mr Tee – GYM 1 Faleata \n– King Kapisi, Feel Style, Lavina Williams,Lani Alo,Cindy of Samoa – GYM 1 Faleata \n– Eddie James Concert – GYM 1 2019\n– Prophet Nelson Visti to Samoa – 2019 LDS Compound Pesega\n– Small Islands Developing States Openning – Faleata Complex – 2014 \n– Savages Concert – GYM 1 – 2009\n– Mat Catinghub – Taumesina Resort 2019\n– Brown Hill Concert – Taumesina Resort 2019\n– DTP Concert – Taumesina Resort 2009\n– Justin Wellington – Tanoa Hotel 2019\n– Annie Grace – Infront of Government Building 2067\n– LIFE CON – Fashion Show 2018/2019\n– Pacific Tuna Conference – Faleata Complex 2014\n– SJ Demarco & Danger Boy\n– Laughing With Samoa – GYM 1 2010\n– Marina Davis\n– Miss SFA 2006 – 2019\n– Miss Samoa – 2016 & 2017\n– Jazz & Blues Festival – Hotel Mellenia 2010\n– Billy TK Junior – STA Fale 2010\n– Bands from the US\n– Opeloges Jazz – Tanoa Tusitala 2008 \n– Teuila Festival – 2009  2014\n– Samoan Star Search\n– Samoa Hip Hop\n– Local Bands to name a few',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
