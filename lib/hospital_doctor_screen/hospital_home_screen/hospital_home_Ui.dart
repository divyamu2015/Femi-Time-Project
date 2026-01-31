import 'package:flutter/material.dart';

class DoctorHomeUI extends StatelessWidget {
  const DoctorHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
  //  final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFB3C7), // light pink
              Color(0xFF6A3DE8), // purple
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// 🖼️ IMAGE SECTION
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    "assets/images/clinic_doctor.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              /// 📄 CONTENT SECTION
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      /// 🏥 TITLE
                      const Text(
                        "Best Online Doctor\nAppointment App",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// 📃 DESCRIPTION
                      const Text(
                        "Book appointments with trusted doctors anytime, anywhere. ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),

                      const Spacer(),

                      /// 🚀 BUTTON
                     
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
