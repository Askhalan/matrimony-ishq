import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/match/domain/entities/match_request_entity.dart';

class MatchRequestModel extends MatchRequestEntity {
  MatchRequestModel(
      {required super.requestedUserDetails,
      required super.requesterId,
      required super.requestedId,
      required super.timestamp,
      required super.status});

  MatchRequestModel copyWith({
    String? requesterId,
    String? requestedId,
    DateTime? timestamp,
    String? status,
    UserEntity? requestedUserDetails,
  }) {
    return MatchRequestModel(
      requesterId: requesterId ?? this.requesterId,
      requestedId: requestedId ?? this.requestedId,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      requestedUserDetails: requestedUserDetails,
    );
  }

//--------------------------------------------- EMPTY MODEL  --------------------------------------

  static MatchRequestModel empty() => MatchRequestModel(
        requesterId: '',
        requestedId: '',
        timestamp: DateTime(2024),
        status: '',
        requestedUserDetails: null,
      );
//----------------------------------------- MODEL TO JSON DATA ------------------------------------

  Map<String, dynamic> toJson() {
    return {
      'requesterId': requesterId,
      'requestedId': requestedId,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'status': status.toString(),
    };
  }

//------------------------------------ CONSTRUCTOR WHICH JSON TO MODEL ----------------------------

  factory MatchRequestModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return MatchRequestModel(
        requesterId: data['requesterId'] ?? '',
        requestedId: data['requestedId'] ?? '',
        timestamp: data['timestamp'] ?? '',
        status: data['status'] ?? '',
        requestedUserDetails: null,
      );
    } else {
      return MatchRequestModel.empty();
    }
  }
}
