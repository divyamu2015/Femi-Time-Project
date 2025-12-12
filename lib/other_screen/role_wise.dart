import 'package:femitime_project/authentication/patient/login_screen/login_view_page.dart';
import 'package:femitime_project/other_screen/doctor_clinic_screen.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _renderBg() {
    return Container(
      color: Colors.white,
      // decoration:
      // BoxDecoration(
      //   // color: const Color(0xFFFFFFFF)
      //   // Image.asset('assets/images/61804.jpg', fit: BoxFit.cover),
      //   image: DecorationImage(
      //     image: AssetImage('assets/images/61802.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(elevation: 0.0, backgroundColor: Color(0x00FFFFFF)),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Colors.orange[100],
            //  color: const Color.fromARGB(255, 196, 223, 236),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  'assets/images/Capture.JPG',
                  height: 200,
                  width: 200,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                label: Text(
                  'PATIENT',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                // icon: Icon(
                //   Icons.person, // or Icons.person_outline
                //   size: 50,
                //   color: const Color.fromARGB(255, 248, 250, 250),
                //   semanticLabel: 'Patient Icon',
                // ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(
                      'Click here to flip back ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '----->',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  'assets/images/WhatsApp Image 2025-08-08 at 16.13.52_da8432b7.jpg',
                  height: 200,
                  width: 200,
                  // height: 200,
                  // width: 200,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FindDoctorPage();
                      },
                    ),
                  );
                },
                label: Text(
                  'DOCTOR',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                // icon: Icon(
                //   Icons.medical_services, // or Icons.person_outline
                //   size: 50,
                //   color: const Color.fromARGB(255, 248, 250, 250),
                //   semanticLabel: 'Doctor Icon',
                // ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(
                      'Click here to flip front ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '<-----',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // <- add this
          leading: CircleAvatar(
            radius: 40,
            child: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/medical-symbol.png',
                height: 35,
                width: 35,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Your Role',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 76, 2, 88),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 141, 176, 194),
        ),

        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _renderBg(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _renderAppBar(context),
                Expanded(flex: 4, child: _renderContent(context)),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
