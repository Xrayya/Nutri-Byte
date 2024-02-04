import 'package:nutri_byte/app/data/models/quest.dart';

List<Quest> questList = [
  Quest(
    title: "Don't eat more than the daily limit!",
    id: 1,
    coin: 5,
    completed: false,
    onChecked: (dailyLog) {
      return dailyLog.calories <= dailyLog.targetCalories;
    },
  ),
  Quest(
    title: "Don't eat more than 44g of fat",
    coin: 5,
    id: 2,
    completed: false,
    onChecked: (dailyLog) {
      return dailyLog.fats <= dailyLog.targetFats;
    },
  ),
  Quest(
    title: "Don't eat more than 60g of protein",
    coin: 5,
    id: 3,
    completed: false,
    onChecked: (dailyLog) {
      return dailyLog.protein <= dailyLog.targetProtein;
    },
  ),
  Quest(
    title: "Don't eat more than 130g of carbs",
    coin: 5,
    id: 4,
    completed: false,
    onChecked: (dailyLog) {
      return dailyLog.carbs <= dailyLog.targetCarbs;
    },
  ),
  Quest(
    title: "Scan 2 foods today",
    coin: 5,
    id: 5,
    completed: false,
    onChecked: (dailyLog) {
      return dailyLog.totalScan >= 2;
    },
  ),
];
