import 'dart:convert';
import 'dart:io';
import 'package:femitime_project/constant_uri.dart';
import 'package:femitime_project/patient_screen/pcod_prediction/input_condition_datas.dart/input_condition_model.dart';
import 'package:http/http.dart' as http;

Future<UserResponseModel> inputHealthProfile({
  required int userId,
  required int age,
  required double weight,
  required double height,
  required double bmi,
  required String fastFoodConsumption, // STRING now
  required String bloodGroup,
  required int cycleRegularity,
  required int hairGrowth,
  required int acne,
  required int moodSwings,
  required int skinDarkening,
  required File pdfFile,
}) async {
  final url = Uri.parse(Urlsss.userInputHealthProfile);
  final request = http.MultipartRequest("POST", url);

  request.fields.addAll({
    "user_id": userId.toString(),
    "age": age.toString(),
    "weight": weight.toString(),
    "height": height.toString(),
    "bmi": bmi.toString(),
    "fast_food": fastFoodConsumption, // FIXED
    "blood_group": bloodGroup,
    "cycle": cycleRegularity == 0 ? "Regular" : "Irregular",
    "hair": mapName(hairGrowth),
    "acne": mapName(acne),
    "mood_swings": mapName(moodSwings),
    "skin_darkening": mapName(skinDarkening),
  });

  request.files.add(
    await http.MultipartFile.fromPath("pdf", pdfFile.path),
  );

  final res = await request.send();
  final responseString = await res.stream.bytesToString();

  if (res.statusCode == 200 || res.statusCode == 201) {
    return UserResponseModel.fromJson(jsonDecode(responseString));
  } else {
    throw Exception("API Error ${res.statusCode}: $responseString");
  }
}

String mapName(int val) {
  switch (val) {
    case 0:
      return "None";
    case 1:
      return "Mild";
    case 2:
      return "Moderate";
    case 3:
      return "Severe";
    default:
      return "None";
  }
}
