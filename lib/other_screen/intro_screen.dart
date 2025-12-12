import 'package:femitime_project/other_screen/role_wise.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void _onIntroEnd(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RoleSelectionScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 166, 177, 240),
      body: Stack(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     opacity: 0.1,
            //     fit: BoxFit.fill,
            //    // image: AssetImage('assets/images/back.jpg'),
            //   ),
            // ),
            child: IntroductionScreen(
              //bodyPadding: EdgeInsets.only(top: 50.0),
              pages: [
                PageViewModel(
                  title: "Welcome to FemiTime",
                  body:
                      "Your personal companion for period tracking, PCOD insights, and women's health support.",
                  image: Image.asset("assets/images/her_time_logo.jpg", height: 175.0),
                ),

                PageViewModel(
                  title: "Smart Period Tracker",
                  body:
                      "Enter your cycle details once — FemiTime automatically predicts your next periods, fertile window, and tracks everything on an interactive calendar.",
                  image: Image.asset(
                    "assets/images/logo2.JPG",
                    height: 175.0,
                  ),
                ),
                PageViewModel(
                  title: "PCOD Detection & Chatbot Support",
                  body:
                      "Upload your scanning report and enter basic health details like height and weight. Get instant AI-based PCOD risk analysis , Ask anything — the smart chatbot is here to guide you 24/7.",
                  image: Image.asset(
                    "assets/images/pcoddetec.jpg",
                    height: 175.0,
                  ),
                ),
                PageViewModel(
                  title: "Find Nearby Doctors",
                  body:
                      "If your PCOD risk is high, FemiTime helps you find trusted gynecologists near you. View profiles and book appointments instantly.",
                  image: Image.asset(
                    "assets/images/images3.jpg",
                    height: 175.0,
                  ),
                ),
              ],
              showSkipButton: true,
              //showDoneButton: true,
              // back: const Text("Back", style: TextStyle(fontWeight: FontWeight.w600)),
              skip: const Text(
                "Skip",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 19, 30, 90),
                ),
              ),
              next: const Text(
                "Next",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 19, 30, 90),
                ),
              ),
              done: const Text(
                "Done",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onDone: () => _onIntroEnd(context),
              dotsDecorator: DotsDecorator(
                size: const Size(10.0, 10.0),
                activeColor: Theme.of(context).colorScheme.secondary,
                color: const Color.fromARGB(255, 12, 22, 82),
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
