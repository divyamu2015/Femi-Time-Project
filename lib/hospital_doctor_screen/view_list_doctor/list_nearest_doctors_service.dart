import 'dart:convert';
import 'package:femitime_project/hospital_doctor_screen/view_list_doctor/list_nearest_doctors_model.dart';
import 'package:http/http.dart' as http;

class DoctorService {
  Future<NearestDoctorsResponse> fetchNearestDoctors({
    required double latitude,
    required double longitude,
   // required String authToken,
  }) async {
    final url = Uri.parse('YOUR_API_URL');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
     
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return NearestDoctorsResponse.fromJson(data);
    } else {
      throw Exception("Failed to load doctors");
    }
  }
}
