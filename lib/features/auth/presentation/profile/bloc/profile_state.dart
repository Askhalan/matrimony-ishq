part of 'profile_bloc.dart';

abstract class ProfileState  {}

class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState{}

final class ProfileFailure extends ProfileState{
  final String error;

  ProfileFailure({required this.error});
}

final class ProfileSuccess extends ProfileState{}


 