class CurrentUserPreferences {
  // Private constructor
  CurrentUserPreferences._();

  // Singleton instance
  static final CurrentUserPreferences _instance = CurrentUserPreferences._();

  // Factory constructor
  factory CurrentUserPreferences() => _instance;

  // User data
  String? uid;
  String? ageStart ;
  String? ageEnd ;
  String? heightStart;
  String? heightEnd;
  List<dynamic>? maritalStatusPref;
  List<dynamic>? educationPref;
  List<dynamic>? jobPref;
  bool isPrefAdded = false;
}
