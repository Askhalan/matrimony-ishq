
class PrefEntity {
  final String? uid;
  final String ageStart;
  final String ageEnd;
  final String heightStart;
  final String heightEnd;
  final List<dynamic> maritalStatusPref;
  final List<dynamic> educationPref;
  final List<dynamic> jobPref;

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
