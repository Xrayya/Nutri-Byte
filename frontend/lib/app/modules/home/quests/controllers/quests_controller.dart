import 'package:get/get.dart';
import 'package:nutri_byte/app/data/models/quest.dart';

class QuestsController extends GetxController {
  RxList<Quest> quests = RxList<Quest>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    quests([
      Quest(
        title: "Don't eat more than the daily limit!",
        coin: 5,
        completed: true,
      ),
      Quest(
        title: "Don’t eat more than 44g of fat",
        coin: 10,
        completed: false,
      ),
      Quest(
        title: "Scan 2 foods today",
        coin: 5,
        completed: false,
      )
    ]);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
