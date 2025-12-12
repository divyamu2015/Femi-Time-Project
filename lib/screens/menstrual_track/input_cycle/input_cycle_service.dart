import 'dart:convert';
import 'dart:io';

import 'package:femitime_project/constant_uri.dart';
import 'package:femitime_project/screens/menstrual_track/input_cycle/input_cycle_model.dart';
import 'package:http/http.dart' as http;

Future<PeriodInputCycle> saveInputCycle({
  required int userId,
  required String dayofperiod,
  required int duration,
  required int cycleLength,
  required String flowIntensity,
  required String symptoms,
  required String description,
}) async {
  try {
    final Map<String, dynamic> body = {
      "user": userId,
      "last_day_of_period": dayofperiod,
      "duration": duration,
      "flow_intensity": flowIntensity,
      "symptoms": symptoms,
      "description": description,
      "average_cycle_length": cycleLength,
    };
    final res = await http.post(
      Uri.parse(Urlsss.periodsInputCycle),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    final Map<String, dynamic> decoded = jsonDecode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      final response = PeriodInputCycle.fromJson(decoded);
      return response;
    }
    else {
      throw Exception("Failed to register user: ${res.statusCode}");
    }
  }
   on SocketException {
    throw Exception('Server Error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad Request');
  }
   catch (e) {
     throw Exception(e.toString());
   }
}
