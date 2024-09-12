import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/app/domain/repositories/request_repository%20copy.dart';
import 'package:ishq/utils/error/failure.dart';

class GetReceivedRequestsStreamUC
    implements StreamUseCase<List<UserEntity>, EmptyParams> {
  final RequestRepository requestRepository;

  GetReceivedRequestsStreamUC({required this.requestRepository});

  @override
  Stream<Either<Failure, List<UserEntity>>> call(EmptyParams parameters) {
    return requestRepository.getReceivedRequestsStream();
  }
}
