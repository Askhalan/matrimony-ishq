import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/features/auth/domain/entities/user_entity.dart';

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
  });

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
      profileImage: '');

// //------------------------------------ CONSTRUCTOR WHICH JSON TO MODEL ---------------------------

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
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
      return UserModel.empty();
    }
  }
}
