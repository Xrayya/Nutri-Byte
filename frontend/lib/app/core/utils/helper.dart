bool isNotEmpty(String? value) {
  return value != null && value.isNotEmpty;
}

bool batchIsNotEmpty(List<String?> values) {
  for (var value in values) {
    if (value == null || value.isEmpty) {
      return false;
    }
  }
  return true;
}

String formatDateTime(DateTime dateTime) {
  //minimal two digit for month and day
  String month = dateTime.month.toString().padLeft(2, '0');
  String day = dateTime.day.toString().padLeft(2, '0');
  return '${dateTime.year}-$month-$day';
}
