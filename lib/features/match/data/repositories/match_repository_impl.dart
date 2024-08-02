
import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/match/data/datasources/match_datasource.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class MatchRepositoryImpl implements MatchRepository{
  final MatchDatasource matchDataSource;

  MatchRepositoryImpl({required this.matchDataSource});
  @override
  Future<Either<Failure, List<UserEntity>>> fetchAllUser() async {
    try{
      final users = await matchDataSource.getAllUser();
      return right(users);
    }catch(e){
      return left(Failure(e.toString()));
    }
  }

}