part of 'match_bloc.dart';

abstract class MatchEvent{}

class InitializeMatch extends MatchEvent{}

final class GetAllusers extends MatchEvent{}

class LoadAllCategories extends MatchEvent {}

class InitializeUser extends MatchEvent{}


// class MatchSendRequest extends MatchEvent {
//   MatchSendRequest({required this.requestedId});
//   final String requestedId;
// }

// class AcceptRequest extends MatchEvent{
//   AcceptRequest({required this.requestedUserUid});
//   final String requestedUserUid;
// }

// final class GetSentRequest extends MatchEvent{}

// final class GetReceivedRequest extends MatchEvent{}

// final class GetAcceptedRequest extends MatchEvent{}