part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class SignupData extends ProfileState {
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
  final XFile? profileImage;

  SignupData(
      {required this.uid,
      required this.profileFor,
      required this.name,
      required this.gender,
      required this.dob,
      required this.maritalStatus,
      required this.email,
      required this.physicalStatus,
      required this.education,
      required this.college,
      required this.employedIn,
      required this.occupation,
      required this.organization,
      required this.familyValues,
      required this.familyStatus,
      required this.familyType,
      required this.familyAbout,
      required this.phoneNo,
      required this.country,
      required this.state,
      required this.city,
      required this.bio,
      required this.profileImage});

  SignupData copyWith({
    String? uid,
    String? profileFor,
    String? name,
    String? gender,
    String? dob,
    String? maritalStatus,
    String? email,
    String? physicalStatus,
    String? education,
    String? college,
    String? employedIn,
    String? occupation,
    String? organization,
    String? familyValues,
    String? familyStatus,
    String? familyType,
    String? familyAbout,
    String? phoneNo,
    String? country,
    String? state,
    String? city,
    String? bio,
    XFile? profileImage,
  }) {
    return SignupData(
      uid: uid ?? this.uid,
      profileFor: profileFor ?? this.profileFor,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      email: email ?? this.email,
      physicalStatus: physicalStatus ?? this.physicalStatus,
      phoneNo: phoneNo ?? this.phoneNo,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      bio: bio ?? this.bio,
      profileImage: profileImage ?? this.profileImage,
      education: education ?? this.education,
      college: college ?? this.college,
      employedIn: employedIn ?? this.employedIn,
      occupation: occupation ?? this.occupation,
      organization: organization ?? this.organization,
      familyValues: familyValues ?? this.familyValues,
      familyStatus: familyStatus ?? this.familyStatus,
      familyType: familyType ?? this.familyType,
      familyAbout: familyAbout ?? this.familyAbout,
    );
  }
}

final class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure({required this.error});
}

final class ProfileSuccess extends ProfileState {}

final class AddPreferencesSuccess extends ProfileState {}

final class AddPreferencesFailure extends ProfileState {
  final String error;

  AddPreferencesFailure({required this.error});
}
