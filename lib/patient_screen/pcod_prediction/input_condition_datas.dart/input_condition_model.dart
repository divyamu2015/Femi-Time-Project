class UserResponseModel {
  final String status;
  final int predictionId;
  final String result;
  final ValuesModel values;

  final double age;
  final double weight;
  final double height;
  final double bmi;

  final int fastFoodConsumption;
  final int bloodGroup;
  final int cycleRegularity;
  final int hairGrowth;
  final int acne;
  final int moodSwings;
  final int skinDarkening;

  UserResponseModel({
    required this.status,
    required this.predictionId,
    required this.result,
    required this.values,
    required this.age,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.fastFoodConsumption,
    required this.bloodGroup,
    required this.cycleRegularity,
    required this.hairGrowth,
    required this.acne,
    required this.moodSwings,
    required this.skinDarkening,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    final inputs = json["user_inputs"] ?? {};

    return UserResponseModel(
      status: json["status"] ?? "",
      predictionId: json["prediction_id"] ?? 0,
      result: json["result"] ?? "",

      values: ValuesModel.fromJson(json["extracted_pdf_values"]),

      age: (inputs["Age"] as num).toDouble(),
      weight: (inputs["Weight"] as num).toDouble(),
      height: (inputs["Height"] as num).toDouble(),
      bmi: (inputs["BMI"] as num).toDouble(),

      fastFoodConsumption: inputs["Fast_Food_Consumption"] ?? 0,
      bloodGroup: inputs["Blood_Group"] ?? 0,
      cycleRegularity: inputs["Cycle_Regularity"] ?? 0,
      hairGrowth: inputs["Hair_Growth"] ?? 0,
      acne: inputs["Acne"] ?? 0,
      moodSwings: inputs["Mood_Swings"] ?? 0,
      skinDarkening: inputs["Skin_Darkening"] ?? 0,
    );
  }
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
}
