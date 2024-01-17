import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/food.dart';
import 'package:nutri_byte/app/data/provider/food_provider.dart';

class FoodRepository {
  final FoodProvider _foodProvider = Get.find<FoodProvider>();
  Future<Food?> getFood(String key) async {
    return await _foodProvider.getFood(key);
  }
}
