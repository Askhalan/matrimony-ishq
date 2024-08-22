class DataHelper {
  static int calculateAge(DateTime dateOfBirth) {
    DateTime today = DateTime.now();
    int age = today.year - dateOfBirth.year;
    if (today.month < dateOfBirth.month ||
        (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  static int safeParseInt(String? value, {int defaultValue = 0}) {
    if (value == null || value.isEmpty) {
      return defaultValue;
    } else {
      String a = value.substring(0, 2);
      return int.parse(a);
    }
  }

  static double safeParseDouble(String? value, {double defaultValue = 0}) {
    if (value == null || value.isEmpty) return defaultValue;
    return double.tryParse(value) ?? defaultValue;
  }
}
