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
