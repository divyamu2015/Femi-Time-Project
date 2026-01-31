import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:femitime_project/authentication/patient/login_screen/login_view_page.dart';
import 'package:femitime_project/patient_screen/articles_screen.dart';
import 'package:femitime_project/patient_screen/do_donts.dart';
import 'package:femitime_project/patient_screen/pcod_prediction/input_condition_datas.dart/input_condition_view.dart';
import 'package:femitime_project/patient_screen/reference_link.dart';
import 'package:femitime_project/patient_screen/view_my_hosbooking.dart';
import 'package:femitime_project/screens/chatbot/chatbot.dart';
import 'package:femitime_project/screens/menstrual_track/input_cycle/input_cycle_view.dart';
import 'package:femitime_project/patient_screen/videos/videos.dart';
import 'package:femitime_project/patient_screen/view_books/view_book.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:typewritertext/typewritertext.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userId});
  final int userId;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  String title = "Femi Time";

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  int? userId;
  late PageController pageController;
// Add these variables
List<dynamic> _doctorCancelledBookings = [];
int get notificationCount => _doctorCancelledBookings.length;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
    userId = widget.userId;
    fetchDoctorCancelledBookings();

  }

  void _showCancelledNotifications() {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Cancelled Appointments'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _doctorCancelledBookings.length,
          itemBuilder: (context, index) {
            final booking = _doctorCancelledBookings[index];
            return Card(
              color: Colors.red.shade50,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking['doctor_name'] ?? 'Unknown Doctor',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Message: Your appointment has been cancelled by the doctor.',
                      style: const TextStyle(color: Colors.black87),
                    ),
                    Text(
                      'Date: ${booking['date']}',
                      style: const TextStyle(color: Colors.black87),
                    ),
                    Text(
                      'Time: ${booking['time']}',
                      style: const TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Status: ${booking['status']}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

Future<void> fetchDoctorCancelledBookings() async {
  final url = Uri.parse(
      'https://417sptdw-8005.inc1.devtunnels.ms/userapp/user/doctor-cancelled-bookings/$userId/');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success' &&
          data['doctor_cancelled_bookings'] != null) {
        setState(() {
          _doctorCancelledBookings = data['doctor_cancelled_bookings'];
        });
      }
    }
  } catch (e) {
    print('Error fetching doctor cancelled bookings: $e');
  }
}

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout Alert"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog first
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(userId: userId!),
                ),
              ); // Navigate to login (Yes)// Close dialog (No)
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog first
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ); // Navigate to login (Yes)
            },
            child: const Text(
              "Yes, Logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

 Widget quickModules() {
  final modules = [
    {'icon': Icons.book, 'label': 'Books'},
    {'icon': Icons.video_library, 'label': 'Videos'},
    {'icon': Icons.link, 'label': 'Links'},
    {'icon': Icons.article, 'label': 'Articles'},
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Quick Modules",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: notificationCount > 0 ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    if (notificationCount > 0) {
                      _showCancelledNotifications();
                    }
                  },
                ),
                if (notificationCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(16),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            final module = modules[index];
            return GestureDetector(
              onTap: () {
                if (module['label'] == 'Books') {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => BookListPage()));
                }
                if (module['label'] == 'Videos') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PregnancyVideoScreen()));
                }
                if (module['label'] == 'Links') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          PeriodsReferencesApp(userId: userId!)));
                }
                if (module['label'] == 'Articles') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PeriodsArticlesApp(userId: userId!)));
                }
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 173, 58, 96).withOpacity(0.12),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      module['icon'] as IconData,
                      size: 38,
                      color: const Color.fromARGB(255, 221, 44, 32),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      '${module['label']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 16),
        ),
      ),
    ],
  );
}


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          key: _sliderDrawerKey,
          sliderOpenSize: 300.0,
          slideDirection: SlideDirection.leftToRight,
          sliderBoxShadow: SliderBoxShadow(
            blurRadius: 25,
            spreadRadius: 5,
            color: const Color.fromARGB(255, 94, 135, 168),
          ),
          slider: _buildDrawer(),
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Image.asset('assets/images/her_time_logo.jpg'),
            ),
          ),
          child: SafeArea(
            child: Scaffold(
              extendBody: true,

              //     floatingActionButton: FloatingActionButton(
              //       onPressed: () {
              //         if (userId != null) {
              //             Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return ChatBotScreen(userId: userId!,);
              //     },
              //   ),
              // );
              //           // Navigator.of(context).push(
              //           //   MaterialPageRoute(
              //           //     builder: (context) {
              //           //     //  return ChatScreen(userId: userId!);
              //           //     },
              //           //   ),
              //           // );
              //         } else {
              //           // Optional: handle error or show a toast/snackbar
              //         }
              //       },
              //       child: Icon(Icons.chat),
              //     ),
              bottomNavigationBar: CircleNavBar(
                activeIcons: const [
                  Icon(Icons.home, color: Colors.deepPurple),
                  Icon(Icons.logout, color: Colors.deepPurple),
                ],
                inactiveIcons: const [Text("Home"), Text("Logout")],
                color: Colors.white,
                height: 60,
                circleWidth: 60,
                activeIndex: tabIndex,
                onTap: (index) {
                  tabIndex = index;
                  pageController.jumpToPage(tabIndex);
                  if (index == 0) {
                    // Navigate to My Booking page
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => ,
                    //   ),
                    // );
                  } else if (index == 1) {
                    _showLogoutDialog(context);
                  }
                },
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                cornerRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
                shadowColor: const Color.fromARGB(255, 248, 219, 175),
                elevation: 10,
              ),
              body: PageView(
                controller: pageController,
                onPageChanged: (v) {
                  tabIndex = v;
                },
                children: [
                  // Home tab page with Quick Modules
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 18),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 20),
                        //   child: Text(
                        //     "Quick Modules",
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 18,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        quickModules(),
                        SizedBox(height: h * 0.1),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                ),
                                child: Row(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: h * 0.3,
                                        width: w * 0.9,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                255,
                                                163,
                                                54,
                                                91,
                                              ).withOpacity(0.12),
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 20,
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: TypeWriter(
                                                      controller:
                                                          TypeWriterController(
                                                            text:
                                                                'Smart Cycle Tracking Made Easy',
                                                            duration:
                                                                const Duration(
                                                                  milliseconds:
                                                                      25,
                                                                ),
                                                          ),
                                                      builder: (context, value) {
                                                        return AutoSizeText(
                                                          value.text,
                                                          maxLines: 10,
                                                          minFontSize: 15.0,
                                                          style: TextStyle(
                                                            color:
                                                                const Color.fromARGB(
                                                                  221,
                                                                  122,
                                                                  2,
                                                                  2,
                                                                ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  TypeWriter(
                                                    controller:
                                                        TypeWriterController(
                                                          text:
                                                              '''Enter your period symptoms and dates — the app automatically tracks your next period, ovulation day, and fertile window using a smart calendar. Simple, accurate, and perfect for managing your cycle.''',
                                                          duration:
                                                              const Duration(
                                                                milliseconds:
                                                                    25,
                                                              ),
                                                        ),
                                                    builder: (context, value) {
                                                      return AutoSizeText(
                                                        value.text,
                                                        maxLines: 10,
                                                        minFontSize: 15.0,
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return PeriodInputScreen(
                                                        userId: userId!,
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                '👩‍🦰Femi Cycle',
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    156,
                                                    8,
                                                    57,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //Text('Enter your period symptoms and dates — the app automatically tracks your next period, ovulation day, and fertile window using a smart calendar. Simple, accurate, and perfect for managing your cycle.'),
                                      ),
                                    ),
                                    SizedBox(width: 18),
                                    Center(
                                      child: Container(
                                        height: h * 0.3,
                                        width: w * 0.9,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                255,
                                                163,
                                                54,
                                                91,
                                              ).withOpacity(0.12),
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 20,
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: TypeWriter(
                                                      controller:
                                                          TypeWriterController(
                                                            text:
                                                                'Smart PCOD Insights With Your Health Data',
                                                            duration:
                                                                const Duration(
                                                                  milliseconds:
                                                                      25,
                                                                ),
                                                          ),
                                                      builder: (context, value) {
                                                        return AutoSizeText(
                                                          value.text,
                                                          maxLines: 10,
                                                          minFontSize: 15.0,
                                                          style: const TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                  221,
                                                                  122,
                                                                  2,
                                                                  2,
                                                                ),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  TypeWriter(
                                                    controller:
                                                        TypeWriterController(
                                                          text:
                                                              '''Upload your scanning report and enter your basic health details — including height and weight. Instantly receive an AI-powered PCOD risk analysis tailored to your body.''',
                                                          duration:
                                                              const Duration(
                                                                milliseconds:
                                                                    25,
                                                              ),
                                                        ),
                                                    builder: (context, value) {
                                                      return AutoSizeText(
                                                        value.text,
                                                        maxLines: 12,
                                                        minFontSize: 15.0,
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return 
                                                      // FindHosDoctorScreen(
                                                      //   userId: userId!,
                                                      // );
                                                       HealthProfileScreen(userId: userId!,);
                                                      //UploadPcodScreen(userId: userId!,);
                                                    },
                                                  ),
                                                );
                                                // Navigate to your PCOD feature screen
                                              },
                                              child: const Text(
                                                '🤖 PCOD Health AI',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                    255,
                                                    156,
                                                    8,
                                                    57,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //Text('Enter your period symptoms and dates — the app automatically tracks your next period, ovulation day, and fertile window using a smart calendar. Simple, accurate, and perfect for managing your cycle.'),
                                      ),
                                    ),
                                    SizedBox(width: 18),
                                    Center(
                                      child: Container(
                                        height: h * 0.3,
                                        width: w * 0.9,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                255,
                                                163,
                                                54,
                                                91,
                                              ).withOpacity(0.12),
                                              blurRadius: 8,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 20,
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: TypeWriter(
                                                      controller:
                                                          TypeWriterController(
                                                            text:
                                                                'Smart Cycle Tracking Made Easy',
                                                            duration:
                                                                const Duration(
                                                                  milliseconds:
                                                                      25,
                                                                ),
                                                          ),
                                                      builder: (context, value) {
                                                        return AutoSizeText(
                                                          value.text,
                                                          maxLines: 10,
                                                          minFontSize: 15.0,
                                                          style: TextStyle(
                                                            color:
                                                                const Color.fromARGB(
                                                                  221,
                                                                  122,
                                                                  2,
                                                                  2,
                                                                ),
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  TypeWriter(
                                                    controller:
                                                        TypeWriterController(
                                                          text:
                                                              '''Ask anything about PCOD — our smart AI ChatBot gives instant, personalized answers to support your health.''',
                                                          duration:
                                                              const Duration(
                                                                milliseconds:
                                                                    25,
                                                              ),
                                                        ),
                                                    builder: (context, value) {
                                                      return AutoSizeText(
                                                        value.text,
                                                        maxLines: 10,
                                                        minFontSize: 15.0,
                                                        style: const TextStyle(
                                                          color: Colors.black87,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return ChatBotScreen(
                                                        userId: userId!,
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                '🧠 PCOD ChatBot',
                                                style: TextStyle(
                                                  color: const Color.fromARGB(
                                                    255,
                                                    156,
                                                    8,
                                                    57,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //Text('Enter your period symptoms and dates — the app automatically tracks your next period, ovulation day, and fertile window using a smart calendar. Simple, accurate, and perfect for managing your cycle.'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ...add your other Home tab content/widgets here
                      ],
                    ),
                  ),
                  Container(color: Colors.transparent),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
      width: 200.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   radius: 40,
            //   child: Icon(Icons.person, size: 50, color: Colors.white),
            //   // backgroundImage: AssetImage('assets/images/user.png'),
            // ),
            SizedBox(height: 10),
            Text('name'),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color.fromARGB(255, 163, 79, 182),
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Color.fromARGB(255, 14, 13, 13)),
              ),
              selectedColor: Colors.purple,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen(userId: userId!);
                    },
                  ),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.feedback_outlined,
            //     color: Color.fromARGB(255, 163, 79, 182),
            //   ),
            //   title: Text(
            //     "Feedback",
            //     style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
            //   ),
            // ),
            ListTile(
              leading: Icon(
                Icons.book_rounded,
                color: Color.fromARGB(255, 103, 30, 119),
              ),
              title: Text(
                "My Appointments",
                style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HosDoctorAppointmentsPages(userId: userId!);
                    },
                  ),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.paypal_sharp,
            //     color: Color.fromARGB(255, 163, 79, 182),
            //   ),
            //   title: Text(
            //     "Videos",
            //     style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.info_outlined,
            //     color: Color.fromARGB(255, 163, 79, 182),
            //   ),
            //   title: Text(
            //     "Articles",
            //     style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
            //   ),
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.logout,
            //     color: Color.fromARGB(255, 163, 79, 182),
            //   ),
            //   title: Text(
            //     "Links",
            //     style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
            //   ),
            //   onTap: () {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return const LoginScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.info_outlined,
                color: Color.fromARGB(255, 163, 79, 182),
              ),
              title: Text(
                "Do or Don'ts",
                style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PeriodsDoDontsApp(userId: userId!);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
