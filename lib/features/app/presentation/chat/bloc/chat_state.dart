part of 'chat_bloc.dart';

 class ChatState  {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatFound extends ChatState {}

final class ChatNotFound extends ChatState {}

final class MessageSendSuccess extends ChatState {}

final class MessageSendFailed extends ChatState {}