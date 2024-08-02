import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/core/common/entities/user_entity.dart';

class UserModelMatch extends UserEntity {
  UserModelMatch({
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
  });

  UserModelMatch copyWith({
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
    return UserModelMatch(
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
    );
  }

//----------------------------------------- MODEL TO JSON DATA ------------------------------------

  Map<String, dynamic> tojson() => {
        'Id': uid,
        'ProfileFor': profileFor,
        'Name': name,
        'Email': email,
        'Gender': gender,
        'Dob': dob,
        'MaritalStatus': maritalStatus,
        'PhysicalStatus': physicalStatus,
        'PhoneNo': phoneNo,
        'Country': country,
        'State': state,
        'City': city,
        'Bio': bio,
        'ProfileImage': profileImage
      };

  static UserModelMatch empty() => UserModelMatch(
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
      profileImage: '');

// //------------------------------------ CONSTRUCTOR WHICH JSON TO MODEL ---------------------------

  factory UserModelMatch.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModelMatch(
        uid: document.id,
        profileFor: data['ProfileFor'] ?? '',
        name: data['Name'] ?? '',
        email: data['Email'] ?? '',
        gender: data['Gender'] ?? '',
        dob: data['Dob'] ?? '',
        maritalStatus: data['MaritalStatus'] ?? '',
        physicalStatus: data['PhysicalStatus'] ?? '',
        phoneNo: data['PhoneNo'] ?? '',
        country: data['country'] ?? '',
        state: data['State'] ?? '',
        city: data['City'] ?? '',
        bio: data['Bio'] ?? '',
        profileImage: data['ProfileImage'] ?? '',
      );
    } else {
      return UserModelMatch.empty();
    }
  }
}
