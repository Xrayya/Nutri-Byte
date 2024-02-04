import 'package:nutri_byte/app/data/models/daily_log.dart';

class Quest {
  Quest(
      {required this.title,
      required this.coin,
      required this.id,
      required this.completed,
      required this.onChecked});

  String title;
  int coin;
  int id;
  bool completed;
  bool Function(DailyLog) onChecked;
}
