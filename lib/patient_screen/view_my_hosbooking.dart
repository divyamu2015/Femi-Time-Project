import 'dart:convert';
import 'package:femitime_project/patient_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HosDoctorAppointmentsPages extends StatefulWidget {
  final int userId;
  const HosDoctorAppointmentsPages({super.key, required this.userId});

  @override
  State<HosDoctorAppointmentsPages> createState() =>
      _HosDoctorAppointmentsPagesState();
}

class _HosDoctorAppointmentsPagesState extends State<HosDoctorAppointmentsPages> {
  List<dynamic> bookings = [];
  bool isLoading = true;
  String? errorText;
  int? userId;

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    fetchBookings();
  }

  String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('dd-MM-yyyy').format(date);
  }

  Future<void> fetchBookings() async {
    setState(() {
      isLoading = true;
      errorText = null;
      bookings.clear();
    });

    final url = Uri.parse(
      'https://417sptdw-8005.inc1.devtunnels.ms/userapp/user/${widget.userId}/hospital/bookings/',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final hospitalBookings = jsonDecode(response.body) as List<dynamic>;

        // Add cancel flag
        for (var b in hospitalBookings) {
          b['isCancelled'] = false;
        }

        setState(() {
          bookings = hospitalBookings;
          isLoading = false;
        });
      } else {
        setState(() {
          errorText = 'Failed to load bookings';
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

  void cancelAppointment(int index) {
    setState(() {
      bookings[index]['isCancelled'] = true;
    });
  }

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
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(userId: userId!),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorText != null
              ? Center(child: Text(errorText!))
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final appoint = bookings[index];
                    final bool isCancelled =
                        appoint['isCancelled'] == true;

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Doctor name
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
                                    appoint['doctor_name'] ?? 'Unknown',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Date & Time
                            Row(
                              children: [
                                const Icon(Icons.calendar_today,
                                    size: 18, color: Color(0xFF06857B)),
                                const SizedBox(width: 6),
                                Text(formatDate(appoint['date'])),
                                const SizedBox(width: 18),
                                const Icon(Icons.access_time_filled,
                                    size: 18, color: Color(0xFF06857B)),
                                const SizedBox(width: 6),
                                Text(appoint['time'] ?? ''),
                              ],
                            ),

                            const SizedBox(height: 14),

                            // Cancel status / Button
                            Align(
                              alignment: Alignment.centerRight,
                              child: isCancelled
                                  ? const Text(
                                      'Cancelled Appointment',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title:
                                                const Text('Cancel Appointment'),
                                            content: const Text(
                                                'Are you sure you want to cancel this appointment?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  cancelAppointment(index);
                                                },
                                                child: const Text(
                                                  'Yes, Cancel',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
