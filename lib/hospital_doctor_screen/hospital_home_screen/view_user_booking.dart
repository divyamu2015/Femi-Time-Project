import 'dart:convert';
import 'package:femitime_project/hospital_doctor_screen/hospital_home_screen/hospital_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HosDoctorAppointmentsPage extends StatefulWidget {
  final int doctorId;
  const HosDoctorAppointmentsPage({super.key, required this.doctorId});

  @override
  State<HosDoctorAppointmentsPage> createState() =>
      _HosDoctorAppointmentsPageState();
}

class _HosDoctorAppointmentsPageState extends State<HosDoctorAppointmentsPage> {
  List<dynamic> bookings = [];
  bool isLoading = true;
  String? errorText;
  int? doctorId;

  @override
  void initState() {
    super.initState();
    fetchBookings();
    doctorId = widget.doctorId;
    print('doctorId=====$doctorId');
  }

  String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr); // "2025-11-01"
    return DateFormat('dd-MM-yyyy').format(date);
  }

  Future<void> cancelBooking(int bookingId, int index) async {
    final url = Uri.parse(
      'https://417sptdw-8005.inc1.devtunnels.ms/userapp/doctor/cancel-booking/$bookingId/${widget.doctorId}/',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"status": "cancelled"}),
      );

      if (response.statusCode == 200) {
        setState(() {
          bookings.removeAt(index); // hide from screen
        });
      }
    } catch (e) {
      debugPrint("Cancel error: $e");
    }
  }

  Future<void> completeBooking(int bookingId, int index) async {
    final url = Uri.parse(
      'https://417sptdw-8005.inc1.devtunnels.ms/userapp/doctor/complete-booking/$bookingId/${widget.doctorId}/',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"status": "completed"}),
      );

      if (response.statusCode == 200) {
        setState(() {
          bookings[index]['local_status'] = 'completed';
        });
      }
    } catch (e) {
      debugPrint("Complete error: $e");
    }
  }

  Future<void> fetchBookings() async {
    setState(() {
      isLoading = true;
      errorText = null;
    });
    final url = Uri.parse(
      'https://417sptdw-8005.inc1.devtunnels.ms/userapp/hospital/doctor/${widget.doctorId}/bookings/',
    );
    print('Fetching bookings from: $url'); // Debug log
    try {
      final response = await http.get(url);
      print('Response code: ${response.statusCode}'); // Debug log
      if (response.statusCode == 200) {
        setState(() {
          bookings = jsonDecode(response.body) as List<dynamic>;
          isLoading = false;
        });
      } else {
        setState(() {
          errorText = 'Failed to load bookings: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorText = 'Error: $e';
        isLoading = false;
      });
    }
  }

  // Future<void> fetchBookings() async {
  //   setState(() {
  //     isLoading = true;
  //     errorText = null;
  //   });
  //   final url = Uri.parse(
  //     'https://417sptdw-8005.inc1.devtunnels.ms/userapp/hospital/doctor/$doctorId/bookings/',
  //   );
  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         bookings = jsonDecode(response.body) as List<dynamic>;
  //         print('----$bookings');
  //         isLoading = false;
  //       });
  //     } else {
  //       setState(() {
  //         errorText = 'Failed to load bookings';
  //         isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     setState(() {
  //       errorText = 'Error: $e';
  //       isLoading = false;
  //     });
  //   }
  // }

  // String formatDate(String date) {
  //   // Expects "2025-11-01" and returns "November 01, 2025"
  //   try {
  //     final d = DateTime.parse(date);
  //     return "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";
  //   } catch (_) {
  //     return date;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      appBar: AppBar(
        title: const Text('My Appointments'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HospaitalDocHomeScreen(doctorId: doctorId!);
                  },
                ),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorText != null
          ? Center(child: Text(errorText!))
          : Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 8.0,
              ),
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final appoint = bookings[index];
                  return Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SL no & patient name
                          Row(
                            children: [
                              Text(
                                "${(index + 1).toString().padLeft(2, '0')}. ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  appoint['user_name'] ?? 'Unknown',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Date and Time row
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 18,
                                color: Color(0xFF06857B),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                formatDate(appoint['date']),
                                style: const TextStyle(
                                  color: Color(0xFF424B5A),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 18),
                              const Icon(
                                Icons.access_time_filled,
                                size: 18,
                                color: Color(0xFF06857B),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                appoint['time'] ?? '',
                                style: const TextStyle(
                                  color: Color(0xFF424B5A),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          // If you want to show doctor name:
                          // const SizedBox(height: 4),
                          // Text("Doctor: ${appoint['doctor_name']}")
                          const SizedBox(height: 12),

                          // Status text
                          if (appoint['local_status'] == 'completed')
                            Text(
                              "Completed",
                              style: TextStyle(
                                color: Colors.green.shade700,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                          if (appoint['local_status'] != 'completed')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Cancel button
                                OutlinedButton(
                                  onPressed: () {
                                    cancelBooking(appoint['id'], index);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: const BorderSide(color: Colors.red),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text("Cancel"),
                                ),

                                const SizedBox(width: 10),

                                // Complete button
                                ElevatedButton(
                                  onPressed: () {
                                    completeBooking(appoint['id'], index);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF06857B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text("Complete"),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
