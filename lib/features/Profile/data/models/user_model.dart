import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/features/auth/domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.name});
//----------------------------------------- MODEL TO JSON DATA ------------------------------------

  Map<String, dynamic> tojson() => {
        'Id': id,
        'Name': name,
        'Email': email,
      };

  static UserModel empty() => UserModel(
      name: '',email: "", id: ''
     
);

//------------------------------------ CONSTRUCTOR WHICH JSON TO MODEL -----------------------------

  factory UserModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          name: data['Name'] ?? '',
          email: data['Email'] ?? '',);
    } else {
      return UserModel.empty();
    }
  }

}
