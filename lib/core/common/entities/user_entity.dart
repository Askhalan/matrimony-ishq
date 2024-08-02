// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ishq/core/common/entities/pref_entity.dart';

class UserEntity {
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
  final PrefEntity? preferences;

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
    required this.profileImage,
    this.preferences,
  });
}
