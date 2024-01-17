class Food {
  final String name;
  final double carbs;
  final double protein;
  final double fats;
  final double calories;

  Food({
    required this.name,
    required this.carbs,
    required this.protein,
    required this.fats,
    required this.calories,
  });

  //generate toJson and fromjson

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      carbs: json['carbs'],
      protein: json['protein'],
      fats: json['fats'],
      calories: json['calories'] + .0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'carbs': carbs,
      'protein': protein,
      'fats': fats,
      'calories': calories,
    };
  }
}
