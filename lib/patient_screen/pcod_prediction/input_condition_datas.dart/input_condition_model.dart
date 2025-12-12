import 'dart:convert';

UserResponseModel userResponseModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

String userResponseModelToJson(UserResponseModel data) =>
    json.encode(data.toJson());

class UserResponseModel {
  final String status;
  final int userId;
  final String user;
  final String result;
  final ValuesModel values;
  final double age;
  final double weight;
  final double height;
  final double bmi;
  final String fastFoodConsumption;
  final String bloodGroup;
  final double pulseRate;
  final String cycleRegularity;
  final String hairGrowth;
  final String acne;
  final String moodSwings;
  final String skinDarkening;

  UserResponseModel({
    required this.status,
    required this.userId,
    required this.user,
    required this.result,
    required this.values,
    required this.age,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.fastFoodConsumption,
    required this.bloodGroup,
    required this.pulseRate,
    required this.cycleRegularity,
    required this.hairGrowth,
    required this.acne,
    required this.moodSwings,
    required this.skinDarkening,
  });

 factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      status: json["status"],
      userId: json["user_id"],
      user: json["user_name"] ?? "",
      result: json["result"],
      values: ValuesModel.fromJson(json["extracted_pdf_values"]),

      age: (json["user_inputs"]["age"] as num).toDouble(),
      weight: (json["user_inputs"]["weight"] as num).toDouble(),
      height: (json["user_inputs"]["height"] as num).toDouble(),
      bmi: (json["user_inputs"]["bmi"] as num).toDouble(),

      fastFoodConsumption: json["user_inputs"]["fast_food_consumption"] ?? "",
      bloodGroup: json["user_inputs"]["blood_group"] ?? "",
      pulseRate: (json["user_inputs"]["pulse_rate"] as num).toDouble(),

      cycleRegularity: json["user_inputs"]["cycle_regularity"] ?? "",
      hairGrowth: json["user_inputs"]["hair_growth"] ?? "",
      acne: json["user_inputs"]["acne"] ?? "",
      moodSwings: json["user_inputs"]["mood_swings"] ?? "",
      skinDarkening: json["user_inputs"]["skin_darkening"] ?? "",
    );


  Map<String, dynamic> toJson() => {
        "status": status,
        "user_id": userId,
        "user": user,
        "result": result,
        "values": values.toJson(),
        "age": age,
        "weight": weight,
        "height": height,
        "bmi": bmi,
        "fast_food_consumption": fastFoodConsumption,
        "blood_group": bloodGroup,
        "pulse_rate": pulseRate,
        "cycle_regularity": cycleRegularity,
        "hair_growth": hairGrowth,
        "acne": acne,
        "mood_swings": moodSwings,
        "skin_darkening": skinDarkening,
      };
}

class ValuesModel {
  final double tsh;
  final double vitaminD;
  final double glucose;
  final double lh;
  final double fsh;
  final double prolactin;
  final double testosterone;
  final double hemoglobin;

  ValuesModel({
    required this.tsh,
    required this.vitaminD,
    required this.glucose,
    required this.lh,
    required this.fsh,
    required this.prolactin,
    required this.testosterone,
    required this.hemoglobin,
  });

  factory ValuesModel.fromJson(Map<String, dynamic> json) => ValuesModel(
        tsh: (json["TSH"] as num).toDouble(),
        vitaminD: (json["VitaminD"] as num).toDouble(),
        glucose: (json["Glucose"] as num).toDouble(),
        lh: (json["LH"] as num).toDouble(),
        fsh: (json["FSH"] as num).toDouble(),
        prolactin: (json["Prolactin"] as num).toDouble(),
        testosterone: (json["Testosterone"] as num).toDouble(),
        hemoglobin: (json["Hemoglobin"] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "TSH": tsh,
        "VitaminD": vitaminD,
        "Glucose": glucose,
        "LH": lh,
        "FSH": fsh,
        "Prolactin": prolactin,
        "Testosterone": testosterone,
        "Hemoglobin": hemoglobin,
      };
}
