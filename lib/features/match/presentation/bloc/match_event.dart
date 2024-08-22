part of 'match_bloc.dart';

abstract class MatchEvent{}

class InitializeMatch extends MatchEvent{}

final class GetAllusers extends MatchEvent{}

class LoadAllCategories extends MatchEvent {}

class InitializeUser extends MatchEvent{}


class MatchSendRequest extends MatchEvent {
  final String requestedId;

  MatchSendRequest({required this.requestedId});
}