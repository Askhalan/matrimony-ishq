part of 'match_bloc.dart';

abstract class MatchState {}

class MatchInitial extends MatchState {}

class FetchUsersSuccessfull extends MatchState {
  final List<UserEntity> allUsers;

  FetchUsersSuccessfull(this.allUsers);
}

class FetchUserLoading extends MatchState {}

class FetchUsersFailure extends MatchState {
  final String message;

  FetchUsersFailure(this.message);
}

//--------------------------------------- trying another approch

class HomeLoading extends MatchState {}

class HomeSuccess extends MatchState {
  final List<UserEntity> ageMatches;
  final List<UserEntity> allUsers;
  final List<UserEntity> maritalStatusMatches;
  final List<UserEntity> jobMatches;

  HomeSuccess({
    required this.allUsers,
    required this.ageMatches,
    required this.maritalStatusMatches,
    required this.jobMatches,
  });
}

class HomeFailure extends MatchState {
  final String message;

  HomeFailure({required this.message});
}

//---------------------------------------- Request States

class RequestLoading extends MatchState {}

class MatchError extends MatchState {
  final String message;

  MatchError(this.message);
}

class RequestSendSuccess extends MatchState {}
