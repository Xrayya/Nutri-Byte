class DailyLog {
  double carbs;
  double protein;
  double fats;
  double calories;

  double targetCarbs;
  double targetProtein;
  double targetFats;
  double targetCalories;

  DailyLog({
    required this.carbs,
    required this.protein,
    required this.fats,
    required this.calories,
    required this.targetCarbs,
    required this.targetProtein,
    required this.targetFats,
    required this.targetCalories,
  });

  factory DailyLog.fromJson(Map<String, dynamic> json) {
    return DailyLog(
      carbs: json['carbs'] + .0,
      protein: json['protein'] + .0,
      fats: json['fats'] + .0,
      calories: json['calories'] + .0,
      targetCarbs: json['targetCarbs'] + .0,
      targetProtein: json['targetProtein'] + .0,
      targetFats: json['targetFats'] + .0,
      targetCalories: json['targetCalories'] + .0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carbs': carbs,
      'protein': protein,
      'fats': fats,
      'calories': calories,
      'targetCarbs': targetCarbs,
      'targetProtein': targetProtein,
      'targetFats': targetFats,
      'targetCalories': targetCalories,
    };
  }
}
