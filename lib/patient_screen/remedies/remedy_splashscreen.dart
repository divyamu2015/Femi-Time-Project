import 'package:femitime_project/patient_screen/remedies/remedy_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

class RemedySplashScreen extends StatefulWidget {
  const RemedySplashScreen({
    super.key,
    //required this.userId
  });
  //final int userId;

  @override
  State<RemedySplashScreen> createState() => _RemedySplashScreenState();
}

class _RemedySplashScreenState extends State<RemedySplashScreen> {
  int? userId;

  @override
  void initState() {
    super.initState();
    //userId = widget.userId;
   displayImage();
  }

  void displayImage() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PCODCareScreen(
              // userId: widget.userId
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ const Color.fromARGB(255, 209, 143, 204), const Color.fromARGB(255, 235, 162, 213), Colors.white, Colors.white,
              const Color.fromARGB(255, 233, 156, 203), const Color.fromARGB(255, 209, 143, 204)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
             shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [ const Color.fromARGB(255, 235, 162, 213), Colors.white, Colors.white, Colors.white,
                  const Color.fromARGB(255, 233, 156, 203), const Color.fromARGB(255, 209, 143, 204)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
              border: Border.all(color: Colors.purple.shade300, width: 2),
            ),
            padding: const EdgeInsets.all(8),
            child: ClipOval(
              child: Image.asset(
                "assets/images/yoga.JPG",
               // width: h * 0.25,
               // height: h * 0.25,
                fit: BoxFit.fitHeight,
              ),
            ).animate().scale(duration: 3.5.seconds, curve: Curves.easeOutBack),
          ),
        ),
      ),
    );
  }
}
