part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class SignupData extends ProfileState {
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

  SignupData(
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

  SignupData copyWith({
    String? uid,
    String? profileFor,
    String? name,
    String? gender,
    String? dob,
    String? maritalStatus,
    String? email,
    String? physicalStatus,
    String? phoneNo,
    String? country,
    String? state,
    String? city,
    String? bio,
    String? profileImage,
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
        profileImage: profileImage ?? this.profileImage);
  }
}

final class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure({required this.error});
}

final class ProfileSuccess extends ProfileState {
  void saveSession(){
    CurrentUser()
    ..uid = ''
    ..profileFor='';
  }
}
