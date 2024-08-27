// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ishq/core/common/entities/user_entity.dart';

class MatchRequestEntity {
  final String requesterId;
  final String requestedId;
  final DateTime timestamp;
  final String status;
  final UserEntity? requestedUserDetails;

  MatchRequestEntity({
    required this.requestedUserDetails,
    required this.requesterId,
    required this.requestedId,
    required this.timestamp,
    required this.status,
  });
}
