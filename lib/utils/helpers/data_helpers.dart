class DataHelper{


 static int calculateAge(DateTime dateOfBirth) {
  DateTime today = DateTime.now();
  int age = today.year - dateOfBirth.year;
  if (today.month < dateOfBirth.month ||
      (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
    age--;
  }
  return age;
}
}