class ChartData {
  ChartData(this.nutritionName, this.currentProgress, this.target, [this.text]) {
    percentage = currentProgress / target * 100;
  }
  final String nutritionName;
  final double currentProgress;
  final double target;
  late double percentage;
  String? text;
}
