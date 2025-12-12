import 'dart:convert';
import 'dart:io';

import 'package:femitime_project/hospital_doctor_screen/dochospital_create/dochospital_create_slot_model.dart';
import 'package:http/http.dart' as http;

Future<HospitalDoctorSlotModel> createHosDoctorSlot({
  required int doctorId,
  required String date,
  required String startTime,
  required String endTime,
  required List<String> timeslots,
}) async {
  try {
    final Map<String, dynamic> body = {
     "doctor": doctorId,
      "date": date,
      "start_time": startTime,
      "end_time": endTime,
      "timeslots": timeslots,
    };
    final url = 'https://417sptdw-8005.inc1.devtunnels.ms/userapp/hospital_doctor_timeslots/';
    print("Create Slot URL: $url");
    final res = await http.post(
      Uri.parse(url),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    print(res.body);
    print("Request body: ${jsonEncode(body)}");
    print("Response status: ${res.statusCode}");
    final Map<String, dynamic> decoded = jsonDecode(res.body);

    if (res.statusCode == 201 || res.statusCode == 201) {
      final response = HospitalDoctorSlotModel.fromJson(decoded);
      return response;
    } else {
      throw Exception("Failed to create slot ${res.statusCode}");
    }
  } on SocketException {
    throw Exception('Server Error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad Request');
  } catch (e) {
    throw Exception(e.toString());
  }
}