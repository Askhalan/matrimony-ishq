import 'package:ishq/features/app/domain/entities/app_data.dart';

class AppDataModel extends AppData {
  AppDataModel(
      {required super.appProfileCreatedFor,
      required super.appMaritalStatus,
      required super.appEducation,
      required super.appEmployedIn,
      required super.appOccupation,
      required super.appFamilyValues,
      required super.appFamilyType,
      required super.appFamilyStatus});

  factory AppDataModel.fromJson(Map<String, dynamic> json) {
    return AppDataModel(
      appEmployedIn: json['appEmployedIn'],
      appEducation: json['appEducation'],
      appFamilyStatus: json['appFamilyStatus'],
      appFamilyType: json['appFamilyType'],
      appFamilyValues: json['appFamilyValues'],
      appMaritalStatus: json['appMaritalStatus'],
      appOccupation: json['appOccupation'],
      appProfileCreatedFor: json['appProfileCreatedFor'],
    );
  }
}
