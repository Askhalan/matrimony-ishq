import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/core/common/entities/pref_entity.dart';

class PrefModel extends PrefEntity {
  PrefModel({
    super.uid,
    required super.ageStart,
    required super.ageEnd,
    required super.heightStart,
    required super.heightEnd,
    required super.maritalStatusPref,
    required super.educationPref,
    required super.jobPref,
  });

  PrefModel copyWith({
    String? uid,
    String? ageStart,
    String? ageEnd,
    String? heightStart,
    String? heightEnd,
    List<dynamic>? maritalStatusPref,
    List<dynamic>? educationPref,
    List<dynamic>? jobPref,
  }) {
    return PrefModel(
      uid: uid ?? this.uid,
      ageStart: ageStart ?? this.ageStart,
      ageEnd: ageEnd ?? this.ageEnd,
      heightStart: heightStart ?? this.heightStart,
      heightEnd: heightEnd ?? this.heightEnd,
      maritalStatusPref: maritalStatusPref ?? this.maritalStatusPref,
      educationPref: educationPref ?? this.educationPref,
      jobPref: jobPref ?? this.jobPref,
    );
  }

//----------------------------------------- MODEL TO JSON DATA ------------------------------------

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'ageStart': ageStart,
        'ageEnd': ageEnd,
        'heightStart': heightStart,
        'heightEnd': heightEnd,
        'maritalStatusPref': maritalStatusPref,
        'educationPref': educationPref,
        'jobPref': jobPref,
      };

  static PrefModel empty() => PrefModel(
        ageStart: '',
        ageEnd: '',
        heightStart: '',
        heightEnd: '',
        maritalStatusPref: List.empty(),
        educationPref: List.empty(),
        jobPref: List.empty(),
      );

// //------------------------------------ CONSTRUCTOR WHICH JSON TO MODEL ---------------------------

  factory PrefModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return PrefModel(
        uid: document.id,
        ageStart: data['ageStart'] ?? '',
        ageEnd: data['ageEnd'] ?? '',
        heightStart: data['heightStart'] ?? '',
        heightEnd: data['heightEnd'] ?? '',
        maritalStatusPref: data['maritalStatusPref'] ?? [] ,
        educationPref: data['educationPref'] ?? [],
        jobPref: data['jobPref'] ?? [],
        
      );
    } else {
      return PrefModel.empty();
    }
  }
}
