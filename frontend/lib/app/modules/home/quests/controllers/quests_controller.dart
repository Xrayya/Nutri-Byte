import 'package:get/get.dart';
import 'package:nutri_byte/app/core/values/quest.dart';
import 'package:nutri_byte/app/data/models/daily_log.dart';
import 'package:nutri_byte/app/data/models/quest.dart';
import 'package:nutri_byte/app/data/services/user_repository.dart';

class QuestsController extends GetxController {
  RxList<Quest> quests = RxList<Quest>();
  final isLoading = false.obs;
  DailyLog? dailyLog;

  final _userRepo = Get.find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() async {
    isLoading.value = true;
    await _userRepo.setQuest();
    dailyLog = await _userRepo.getDailyLog();
    setQuestsFromListInt(dailyLog!.quests!);
    // TODO: implement add the poin in the end of the day or before new log triggered
    isLoading.value = false;
  }

  void setQuestsFromListInt(List<int> logQuestList) {
    quests.clear();
    logQuestList.forEach((element) {
      quests.add(questList.firstWhere((quest) => quest.id == element));
    });
  }
}
