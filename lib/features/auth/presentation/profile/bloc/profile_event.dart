part of 'profile_bloc.dart';

abstract class ProfileEvent {}

//---------------- Add Auth Details ----------------

final class AddAuthDetails extends ProfileEvent {
  final String email;

  AddAuthDetails({required this.email});
}

//---------------- Add Basic Details ---------------

final class AddBasicDetails extends ProfileEvent {
  final String profileFor;
  final String name;
  final String gender;
  final String dob;
  final String maritalStatus;
  final String physicalStatus;

  AddBasicDetails(
      {required this.profileFor,
      required this.name,
      required this.gender,
      required this.dob,
      required this.maritalStatus,
      required this.physicalStatus});
}

//---------------- Add Address Details -------------

final class AddAddressDetails extends ProfileEvent {
  final String phoneNo;
  final String country;
  final String state;
  final String city;

  AddAddressDetails(
      {required this.phoneNo,
      required this.country,
      required this.state,
      required this.city});
}

//---------------- Add Photo Details ---------------

final class AddProfilePhoto extends ProfileEvent {
  final XFile? profileImage;
  AddProfilePhoto({required this.profileImage});
}

//---------------- Save User Record ----------------

final class SaveUser extends ProfileEvent {}

//---------------- Add Basic Details ---------------

final class AddPreferences extends ProfileEvent {
  final String? uid;
  final String ageStart;
  final String ageEnd;
  final String heightStart;
  final String heightEnd;
  final List<String> maritalStatusPref;
  final List<String> educationPref;
  final List<String> jobPref;

  AddPreferences(
      {required this.uid,
      required this.ageStart,
      required this.ageEnd,
      required this.heightStart,
      required this.heightEnd,
      required this.maritalStatusPref,
      required this.educationPref,
      required this.jobPref});
}
