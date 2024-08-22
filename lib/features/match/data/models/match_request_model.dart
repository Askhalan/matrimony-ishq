import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ishq/features/match/domain/entities/matchentity.dart';

class MatchRequestModel extends MatchRequestEntity {
  MatchRequestModel(
      {required super.requesterId,
      required super.requestedId,
      required super.timestamp,
      required super.status});

  MatchRequestModel copyWith({
    String? requesterId,
    String? requestedId,
    DateTime? timestamp,
    String? status,
  }) {
    return MatchRequestModel(
      requesterId: requesterId ?? this.requesterId,
      requestedId: requestedId ?? this.requestedId,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
    );
  }

//--------------------------------------------- EMPTY MODEL  --------------------------------------

  static MatchRequestModel empty() => MatchRequestModel(
        requesterId: '',
        requestedId: '',
        timestamp: DateTime(2024),
        status: '',
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
      );
    } else {
      return MatchRequestModel.empty();
    }
  }
}
