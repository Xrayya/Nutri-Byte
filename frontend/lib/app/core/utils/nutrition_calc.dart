import 'package:nutri_byte/app/core/utils/helper.dart';
import 'package:nutri_byte/app/data/models/nutribyte_user.dart';
import 'package:nutri_byte/app/data/models/nutritions.dart';

Nutritions? calculateNutrition(NutribyteUser? user) {
  if (user == null) {
    return null;
  }

  Nutritions nutritions = Nutritions(
    carbsGr: 0,
    proteinGr: 0,
    fatGr: 0,
    calories: 0,
  );
  DateTime? userDateOfBirth = parseDateTimeString(user.dateOfBirth);

  if (userDateOfBirth == null) {
    return nutritions;
  }

  double calories = 10 * user.weight +
      6.25 * user.height -
      5 * calculateAge(DateTime.now(), userDateOfBirth) +
      (user.gender == "Men" ? 5 : (-161));

  switch (user.activityLevel) {
    case 1:
      calories *= 1.2;
      break;
    case 2:
      calories *= 1.375;
      break;
    case 3:
      calories *= 1.55;
      break;
    case 4:
      calories *= 1.725;
      break;
    case 5:
      calories *= 1.9;
  }

  double carbCalories = 0;
  double proteinCalories = 0;
  double fatCalories = 0;

  switch (user.goalType) {
    case 1:
      carbCalories = 0.25 * calories;
      proteinCalories = 0.5 * calories;
      fatCalories = 0.25 * calories;
      break;
    case 2:
      carbCalories = 0.25 * calories;
      proteinCalories = 0.5 * calories;
      fatCalories = 0.25 * calories;
      break;
    case 3:
      carbCalories = 0.45 * calories;
      proteinCalories = 0.25 * calories;
      fatCalories = 0.20 * calories;
      break;
  }

  nutritions.carbsGr = carbCalories / 4.1;
  nutritions.fatGr = fatCalories / 9.3;
  nutritions.proteinGr = proteinCalories / 4.1;
  nutritions.calories = calories;

  return nutritions;
}
