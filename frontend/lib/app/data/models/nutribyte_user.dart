class NutribyteUser {
  final String uid;
  final String gender;
  final String name;
  final String dateOfBirth;
  final int height;
  final int weight;
  final int activityLevel;
  final int goalType;
  final int weightLossLevel;
  final int weightGainLevel;
  int points;

  NutribyteUser({
    required this.activityLevel,
    required this.dateOfBirth,
    required this.gender,
    required this.name,
    required this.goalType,
    required this.height,
    required this.uid,
    required this.weight,
    required this.weightGainLevel,
    required this.weightLossLevel,
    this.points = 0,
  });

  factory NutribyteUser.fromJson(Map<String, dynamic> json) {
    return NutribyteUser(
      uid: json['uid'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      activityLevel: json['activityLevel'] as int,
      goalType: json['goalType'] as int,
      weightLossLevel: json['weightLossLevel'] as int,
      weightGainLevel: json['weightGainLevel'] as int,
      points: json['points'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'gender': gender,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'height': height,
      'weight': weight,
      'activityLevel': activityLevel,
      'goalType': goalType,
      'weightLossLevel': weightLossLevel,
      'weightGainLevel': weightGainLevel,
      'points': points,
    };
  }
}
