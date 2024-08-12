// ignore_for_file: public_member_api_docs, sort_constructors_first



class UserEntity {
  final String? uid;
  final String email;
//-----------------------------------
  final String profileFor;
  final String name;
  final String gender;
  final String dob;
  final String maritalStatus;
  final String physicalStatus;
//-----------------------------------
  final String education;
  final String college;
  final String employedIn;
  final String occupation;
  final String organization;
//-----------------------------------
  final String phoneNo;
  final String country;
  final String state;
  final String city;
  final String bio;
  //----------------------------------
  final String familyValues;
  final String familyStatus;
  final String familyType;
  final String familyAbout;
  //----------------------------------
  final String profileImage;

  UserEntity({
    this.uid,
    required this.profileFor,
    required this.name,
    required this.gender,
    required this.dob,
    required this.maritalStatus,
    required this.email,
    required this.physicalStatus,
    required this.phoneNo,
    required this.country,
    required this.state,
    required this.city,
    required this.bio,
    required this.education,
    required this.college,
    required this.employedIn,
    required this.occupation,
    required this.organization,
    required this.familyValues,
    required this.familyStatus,
    required this.familyType,
    required this.familyAbout,
    required this.profileImage,
  });
}
