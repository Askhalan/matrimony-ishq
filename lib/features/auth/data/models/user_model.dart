import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/core/common/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.uid,
    required super.profileFor,
    required super.name,
    required super.gender,
    required super.dob,
    required super.maritalStatus,
    required super.email,
    required super.physicalStatus,
    required super.phoneNo,
    required super.country,
    required super.state,
    required super.city,
    required super.bio,
    required super.profileImage,
    required super.education,
    required super.college,
    required super.employedIn,
    required super.occupation,
    required super.organization,
    required super.familyValues,
    required super.familyStatus,
    required super.familyType,
    required super.familyAbout,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? profileFor,
    String? name,
    String? gender,
    String? dob,
    String? maritalStatus,
    String? physicalStatus,
    String? education,
    String? college,
    String? employedIn,
    String? occupation,
    String? organization,
    String? phoneNo,
    String? country,
    String? state,
    String? city,
    String? bio,
    String? familyValues,
    String? familyStatus,
    String? familyType,
    String? familyAbout,
    String? profileImage,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      profileFor: profileFor ?? this.profileFor,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      physicalStatus: physicalStatus ?? this.physicalStatus,
      education: education ?? this.education,
      college: college ?? this.college,
      employedIn: employedIn ?? this.employedIn,
      occupation: occupation ?? this.occupation,
      organization: organization ?? this.organization,
      phoneNo: phoneNo ?? this.phoneNo,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      bio: bio ?? this.bio,
      familyValues: familyValues ?? this.familyValues,
      familyStatus: familyStatus ?? this.familyStatus,
      familyType: familyType ?? this.familyType,
      familyAbout: familyAbout ?? this.familyAbout,
      profileImage: profileImage ?? this.profileImage,
    );
  }

//----------------------------------------- EMPTY USER MODEL ------------------------------------

  static UserModel empty() => UserModel(
      profileFor: '',
      name: '',
      gender: '',
      dob: '',
      maritalStatus: '',
      physicalStatus: '',
      email: '',
      phoneNo: '',
      country: '',
      state: '',
      city: '',
      bio: '',
      profileImage: '',
      education: '',
      college: '',
      employedIn: '',
      occupation: '',
      organization: '',
      familyValues: '',
      familyStatus: '',
      familyType: '',
      familyAbout: '');

  //----------------------------------------- MODEL TO JSON DATA ------------------------------------

  Map<String, dynamic> tojson() => {
        'uid': uid,
        'email': email,
        'profileFor': profileFor,
        'name': name,
        'gender': gender,
        'dob': dob,
        'maritalStatus': maritalStatus,
        'physicalStatus': physicalStatus,
        'education': education,
        'college': college,
        'employedIn': employedIn,
        'occupation': occupation,
        'organization': organization,
        'phoneNo': phoneNo,
        'country': country,
        'state': state,
        'city': city,
        'bio': bio,
        'familyValues': familyValues,
        'familyStatus': familyStatus,
        'familyType': familyType,
        'familyAbout': familyAbout,
        'profileImage': profileImage
      };

// //------------------------------------ CONSTRUCTOR WHICH JSON TO MODEL ---------------------------

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        uid: document.id,
        profileFor: data['profileFor'] ?? '',
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        gender: data['gender'] ?? '',
        dob: data['dob'] ?? '',
        maritalStatus: data['maritalStatus'] ?? '',
        physicalStatus: data['physicalStatus'] ?? '',
        phoneNo: data['phoneNo'] ?? '',
        country: data['country'] ?? '',
        state: data['state'] ?? '',
        city: data['city'] ?? '',
        bio: data['bio'] ?? '',
        profileImage: data['profileImage'] ?? '',
        education: data['education'] ?? '',
        college: data['college'] ?? '',
        employedIn: data['employedIn'] ?? '',
        occupation: data['occupation'] ?? '',
        organization: data['organization'] ?? '',
        familyValues: data['familyValues'] ?? '',
        familyStatus: data['familyStatus'] ?? '',
        familyType: data['familyType'] ?? '',
        familyAbout: data['familyAbout'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
