class MatchRequestEntity {
  final String requesterId;
  final String requestedId;
  final DateTime timestamp;
  final String status;

  MatchRequestEntity(
      {required this.requesterId,
      required this.requestedId,
      required this.timestamp,
      required this.status});
}

enum RequestStatus { pending, accepted, rejected }
