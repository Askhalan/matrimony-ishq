part of 'request_bloc.dart';

sealed class RequestState{}

final class RequestInitial extends RequestState {}



//---------------------------------------- Request States

class RequestLoading extends RequestState {}

class RequestError extends RequestState {
  RequestError(this.message);
  final String message;
}

class RequestSuccess extends RequestState {}

class RequestAcceptSuccess extends RequestState {}

class RequestFetchingLoading extends RequestState {}

class SentRequestLoaded extends RequestState {
  List<UserEntity> users;
  SentRequestLoaded({
    required this.users,
  });
}

class RecievedRequestLoaded extends RequestState {
  List<UserEntity> users;
  RecievedRequestLoaded({
    required this.users,
  });
}

class AcceptedRequestLoaded extends RequestState {
  List<UserEntity> users;
  AcceptedRequestLoaded({
    required this.users,
  });
}

class RequestLoadingError extends RequestState {
  RequestLoadingError(this.message);
  final String message;
}
