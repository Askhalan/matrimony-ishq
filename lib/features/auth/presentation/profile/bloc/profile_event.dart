part of 'profile_bloc.dart';

abstract class ProfileEvent  {}


final class SaveUser extends ProfileEvent{
  final String? uid;
  final String profileFor;
  final String name;
  final String gender;
  final String dob;
  final String maritalStatus;
  final String email;
  final String physicalStatus;
  final String phoneNo;
  final String country;
  final String state;
  final String city;
  final String bio;
  final String? profileImage;

  SaveUser(
      {required this.uid,
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
      required this.profileImage});
}