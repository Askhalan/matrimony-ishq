// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'match_bloc.dart';

abstract class MatchState {}

class MatchInitial extends MatchState {}

class FetchUsersSuccessfull extends MatchState {
  FetchUsersSuccessfull(this.allUsers);
  final List<UserEntity> allUsers;
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
  HomeFailure({required this.message});
  final String message;
}

// //---------------------------------------- Request States

// class RequestLoading extends MatchState {}

// class RequestError extends MatchState {
//   RequestError(this.message);
//   final String message;
// }

// class RequestSuccess extends MatchState {}

// class RequestAcceptSuccess extends MatchState {}

// class RequestFetchingLoading extends MatchState {}

// class SentRequestLoaded extends MatchState {
//   List<UserEntity> users;
//   SentRequestLoaded({
//     required this.users,
//   });
// }

// class RecievedRequestLoaded extends MatchState {
//   List<UserEntity> users;
//   RecievedRequestLoaded({
//     required this.users,
//   });
// }

// class AcceptedRequestLoaded extends MatchState {
//   List<UserEntity> users;
//   AcceptedRequestLoaded({
//     required this.users,
//   });
// }

// class RequestLoadingError extends MatchState {
//   RequestLoadingError(this.message);
//   final String message;
// }
