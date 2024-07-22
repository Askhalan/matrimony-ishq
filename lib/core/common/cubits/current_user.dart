
class CurrentUser{

  // Private constructor
  CurrentUser._();

  // Singleton instance
  static final CurrentUser _instance = CurrentUser._();

  // Factory constructor
  factory CurrentUser() => _instance;

  // User data
   String? uid;
   String? profileFor;
   String? name;
   String? gender;
   String? dob;
   String? maritalStatus;
   String? email;
   String? physicalStatus;
   String? phoneNo;
   String? country;
   String? state;
   String? city;
   String? bio;
   String? profileImage;
}