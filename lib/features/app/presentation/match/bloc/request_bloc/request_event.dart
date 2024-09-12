part of 'request_bloc.dart';

sealed class RequestEvent  {}

class MatchSendRequest extends RequestEvent {
  MatchSendRequest({required this.requestedId});
  final String requestedId;
}

class AcceptRequest extends RequestEvent{
  AcceptRequest({required this.requestedUserUid});
  final String requestedUserUid;
}

final class GetSentRequest extends RequestEvent{}

final class GetReceivedRequest extends RequestEvent{}

final class GetAcceptedRequest extends RequestEvent{}