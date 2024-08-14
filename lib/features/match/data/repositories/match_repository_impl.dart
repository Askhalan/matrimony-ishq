import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/features/match/data/datasources/match_datasource.dart';
import 'package:ishq/features/match/data/models/user_model_match.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';

class MatchRepositoryImpl implements MatchRepository {
  final MatchDatasource matchDataSource;
  List<String> locations = ['kollam', 'Alappuzha', 'Wayanad'];
  List<UserModelMatch> usersCache = const [];
  MatchRepositoryImpl({required this.matchDataSource});
  @override
  Future<Either<Failure, List<UserModelMatch>>> fetchAllUser() async {
    try {
      final users = await matchDataSource.getAllUser();
      return right(users);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //------------------------ In this approch: All the users are being categeorised
  //and added to a map which contains list. and this single map is shared. But to make it
  //more future proof < TRYING ANOTHE APPROCH

  @override
  Future<Either<Failure, Map<String, List<UserModelMatch>>>>
      fetchAndCategorizeUsers() async {
    try {
      //----- Fetch all users from Firebase
      final List<UserModelMatch> users = await matchDataSource.getAllUser();

      //----- Categorize users
      final Map<String, List<UserModelMatch>> categorizedUsers = {
        'ageMatches': [],
        'locationMatches': [],
        'professionalMatches': [],
        'familyMatches': [],
        'lifeStyleMatches': [],
        'topMatches': [],
      };

      //----- Implementing categorization logics
      for (final user in users) {
        if (int.parse(user.dob) >
            int.parse(CurrentUserPreferences().ageStart ?? '0')) {
          categorizedUsers['ageMatches']?.add(user);
        } else if (locations.contains(user.city)) {
          categorizedUsers['locationMatches']?.add(user);
        }
      }

      return right(categorizedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
//=============================================================================================================

//--------------------------------- Age Based Categeorization -------------------------------------

  // @override
  // Future<Either<Failure, List<UserEntity>>> fetchAgeMatchUsers() async {
  //   try {
  //     log(int.parse(CurrentUserPreferences().ageStart ?? '0').toString());
  //     final users = await matchDataSource.getAllUser();
  //     final List<UserModelMatch> ageMachedUsers = [];
  //     //----- Implementing categorization logics
  //     for (final user in users) {
  //       log('${int.parse(user.dob)} > ${DataHelper.safeParseInt(CurrentUserPreferences().ageStart, defaultValue: 18)}');
  //       log('${int.parse(user.dob)} < ${DataHelper.safeParseInt(CurrentUserPreferences().ageEnd, defaultValue: 60)}');
  //       if (int.parse(user.dob) >
  //               DataHelper.safeParseInt(CurrentUserPreferences().ageStart,
  //                   defaultValue: 18) &&
  //           int.parse(user.dob) <
  //               DataHelper.safeParseInt(CurrentUserPreferences().ageEnd,
  //                   defaultValue: 60)) {
  //         ageMachedUsers.add(user);
  //       }
  //     }

  //     log(ageMachedUsers.toString());
  //     return right(ageMachedUsers);
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }

  @override
  Future<List<UserEntity>> fetchAgeMatchUsers() async {
    log('Calling function');
    try {
      log(int.parse(CurrentUserPreferences().ageStart ?? '0').toString());
      final users = await matchDataSource.getAllUser();
      final List<UserModelMatch> ageMachedUsers = [];
      //----- Implementing categorization logics
      for (final user in users) {
        log('${int.parse(user.dob)} > ${DataHelper.safeParseInt(CurrentUserPreferences().ageStart, defaultValue: 18)}');
        log('${int.parse(user.dob)} < ${DataHelper.safeParseInt(CurrentUserPreferences().ageEnd, defaultValue: 60)}');
        if (int.parse(user.dob) >
                DataHelper.safeParseInt(CurrentUserPreferences().ageStart,
                    defaultValue: 18) &&
            int.parse(user.dob) <
                DataHelper.safeParseInt(CurrentUserPreferences().ageEnd,
                    defaultValue: 60)) {
          ageMachedUsers.add(user);
        }
      }

      return ageMachedUsers;
    } catch (e) {
      log('e');
      throw ();
    }
  }
//---------------------------- Marital Status Based Categeorization -------------------------------------

  @override
  Future<Either<Failure, List<UserEntity>>>
      fetchMritalStatusMatchUsers() async {
    try {
      final users = await matchDataSource.getAllUser();
      final List<UserModelMatch> locationMachedUsers = [];
      //----- Implementing categorization logics
      for (final user in users) {
        if (CurrentUserPreferences()
            .maritalStatusPref!
            .contains(user.maritalStatus)) {
          locationMachedUsers.add(user);
        }
      }

      return right(locationMachedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
