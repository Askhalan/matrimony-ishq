import 'package:fpdart/fpdart.dart';
import 'package:ishq/utils/error/failure.dart';

abstract interface class UseCase<SuccessType,Parameters>{
  Future<Either<Failure,SuccessType>> call(Parameters parameters);
}