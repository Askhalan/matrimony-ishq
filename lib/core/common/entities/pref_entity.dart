
class PrefEntity {
  final String? uid;
  final String ageStart;
  final String ageEnd;
  final String heightStart;
  final String heightEnd;
  final List<String> maritalStatusPref;
  final List<String> educationPref;
  final List<String> jobPref;

  PrefEntity(
      {this.uid,
      required this.ageStart,
      required this.ageEnd,
      required this.heightStart,
      required this.heightEnd,
      required this.maritalStatusPref,
      required this.educationPref,
      required this.jobPref});

  


}
