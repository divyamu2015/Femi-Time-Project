import 'dart:convert';
import 'dart:io';
import 'package:femitime_project/patient_screen/list_nearbyhos_doc/list_nearbyhos_doc_model.dart';
import 'package:http/http.dart' as http;

Future<List<NearbyHosDoctor>> listofNearestHosDoc({required int userId}) async {
  try {
    final url =
        'https://417sptdw-8005.inc1.devtunnels.ms/userapp/view_nearby_hospital_doctors/$userId/';
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    print(url);
    print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      print(decoded);
      final List<dynamic> list = decoded['nearby_hospital_doctors'] ?? [];
      return list.map((e) => NearbyHosDoctor.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch doctors: ${response.statusCode}");
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
