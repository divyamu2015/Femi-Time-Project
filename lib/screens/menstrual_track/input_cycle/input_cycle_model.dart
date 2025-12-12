class PeriodInputCycle {
  final int id;
  final String lastDayOfPeriod;
  final int duration;
  final int cycleLength;
  final String flowIntensity;
  final String symptoms;
  final String description;
  final String createdAt;
  final int user;

  PeriodInputCycle({
    required this.id,
    required this.lastDayOfPeriod,
    required this.duration,
    required this.flowIntensity,
    required this.symptoms,
    required this.description,
    required this.createdAt,
    required this.user,
    required this.cycleLength,
  });

  // Convert JSON -> Model
  factory PeriodInputCycle.fromJson(Map<String, dynamic> json) {
    return PeriodInputCycle(
      id: json['id'] ?? 0,
      lastDayOfPeriod: json['last_day_of_period'] ?? '',
      duration: json['duration'] ?? 0,
      cycleLength: json['average_cycle_length'] ?? 0,
      flowIntensity: json['flow_intensity'] ?? '',
      symptoms: json['symptoms'] ?? '',
      description: json['description'] ?? '',
      createdAt: json['created_at'] ?? '',
      user: json['user'] ?? 0,
    );
  }

  // Convert Model -> JSON (for sending data back to API)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "last_day_of_period": lastDayOfPeriod,
      "duration": duration,
      "flow_intensity": flowIntensity,
      "symptoms": symptoms,
      "description": description,
      "created_at": createdAt,
      "user": user,
    };
  }
}
