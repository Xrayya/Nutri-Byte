import 'package:nutri_byte/app/core/constant.dart';
import 'package:nutri_byte/app/data/models/food.dart';

class FoodProvider {
  Future<Food?> getFood(String key) async {
    final result = await firestore.collection('foods').doc(key).get();
    if (result.exists) {
      return Food.fromJson(result.data()!);
    } else {
      return null;
    }
  }
}
