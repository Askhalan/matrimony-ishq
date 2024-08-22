// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/features/match/data/models/user_model_match.dart';
import 'package:ishq/utils/error/failure.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';

class CategeorizationHelperFns {
  Future<Either<Failure, List<UserModelMatch>>> fetchAgeMatchUsers(
      List<UserModelMatch> allUsers) async {
    try {
      final List<UserModelMatch> ageMatchedUsers = [];
      for (final user in allUsers) {
        print('$user is ${user.dob} > ${CurrentUserPreferences().ageStart}');
        if (int.parse(user.dob) >=
                DataHelper.safeParseInt(CurrentUserPreferences().ageStart,
                    defaultValue: 18) &&
            int.parse(user.dob) <
                DataHelper.safeParseInt(CurrentUserPreferences().ageEnd,
                    defaultValue: 60)) {
          ageMatchedUsers.add(user);
          print('$user has been added to list');
        }
      }
      return right(ageMatchedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<UserModelMatch>>> fetchMritalStatusMatchUsers(
      List<UserModelMatch> allUsers) async {
    try {
      final List<UserModelMatch> maritalStatusMatchedUsers = [];
      if (CurrentUserPreferences().maritalStatusPref == null) {
        maritalStatusMatchedUsers.addAll(allUsers);
      } else {
        for (final user in allUsers) {
          if (CurrentUserPreferences()
              .maritalStatusPref!
              .contains(user.maritalStatus)) {
            maritalStatusMatchedUsers.add(user);
          }
        }
      }
      return right(maritalStatusMatchedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, List<UserModelMatch>>> fetchJobMatchUsers(
      List<UserModelMatch> allUsers) async {
    try {
      final List<UserModelMatch> jobMatchedUsers = [];
      if (CurrentUserPreferences().jobPref == null) {
        jobMatchedUsers.addAll(allUsers);
      } else {
        for (final user in allUsers) {
          if (CurrentUserPreferences().jobPref!.contains(user.maritalStatus)) {
            jobMatchedUsers.add(user);
          }
        }
      }
      return right(jobMatchedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
