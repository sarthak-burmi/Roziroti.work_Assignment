import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showContainer = true;
  bool showSecondAnimatedText = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.extentAfter == 0) {
            setState(() {
              showContainer = false;
            });
          } else {
            setState(() {
              showContainer = true;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Image.asset(
                "assets/images/BackgroundImage.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "History of Ram Mandir",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.oswald(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        AnimatedTextKit(
                          onFinished: () {
                            setState(() {
                              showSecondAnimatedText = true;
                            });
                          },
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "The Shri Ram Mandir finds its mythical roots in the Ramayana, an ancient Hindu epic attributed to the sage Valmiki. The Ramayana narrates the life and adventures of Lord Rama, the seventh avatar of Lord Vishnu. According to Hindu mythology, Lord Rama was born in Ayodhya to King Dasharatha and Queen Kaushalya.\n\nThe epic begins with the divine birth of Rama and his three brothers, Bharata, Lakshmana, and Shatrughna. The early years of Rama’s life are marked by his marriage to Sita, an incarnation of the goddess Lakshmi. However, Rama’s exile to the forest, prompted by the schemes of his stepmother Kaikeyi, sets in motion a series of events leading to the legendary battle against the demon king Ravana.\n\nThe central episode of the Ramayana, known as the “Ramayana Yuddha” or the Battle of Lanka, culminates in Rama’s victory over Ravana and the rescue of Sita. After the triumphant return to Ayodhya, Rama is crowned as the king, marking the beginning of the ideal rule known as “Ram Rajya.” The narrative of the Ramayana encapsulates themes of duty, righteousness, and the victory of good over evil.",
                              textStyle: GoogleFonts.playfairDisplay(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.justify,
                              speed: const Duration(milliseconds: 10),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        if (showSecondAnimatedText)
                          Column(
                            children: [
                              Text(
                                "Ayodhya as the Sacred Abode",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.oswald(
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 20),
                              AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "Ayodhya, the birthplace of Lord Rama, holds profound significance in Hindu tradition. The city is depicted as a symbol of dharma (righteousness) and the epitome of an ideal kingdom. The belief that Ayodhya is the divine abode of Lord Rama has been passed down through generations, fostering a deep emotional and spiritual connection for Hindus.\n\nThe Ramayana describes Ayodhya as a magnificent city adorned with grand palaces, lush gardens, and noble citizens. The narrative paints a vivid picture of the utopian society under Rama’s rule, emphasizing principles of justice, virtue, and compassion. The association of Ayodhya with Lord Rama’s birth transforms the city into a sacred pilgrimage site for devotees seeking to connect with the divine.",
                                    textStyle: GoogleFonts.playfairDisplay(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.justify,
                                    speed: const Duration(milliseconds: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 50,
              right: 50,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 90),
                opacity: showContainer ? 0.90 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: 150,
                  height: 40,
                  child: const Center(
                    child: Text(
                      "Scroll Down For More",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
