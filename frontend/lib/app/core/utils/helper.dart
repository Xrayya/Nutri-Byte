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

DateTime? parseDateTimeString(String dateString) {
  int boundary = dateString.indexOf("/");
  if (boundary == -1) {
    return null;
  }
  int date = int.parse(dateString.substring(0, boundary));

  dateString = dateString.substring(boundary + 1, dateString.length);
  boundary = dateString.indexOf("/");
  if (boundary == -1) {
    return null;
  }
  int month = int.parse(dateString.substring(0, boundary));

  dateString = dateString.substring(boundary + 1, dateString.length);
  int year = int.parse(dateString);

  return DateTime(year, month, date);
}

int calculateAge(DateTime today, DateTime dob) {
  int year = today.year - dob.year;
  int mth = today.month - dob.month;
  int days = today.day - dob.day;
  if (mth < 0 && days < 0) {
    year--;
  }

  return year;
}
