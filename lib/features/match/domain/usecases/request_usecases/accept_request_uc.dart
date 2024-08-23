import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/match/domain/repositories/request_repository%20copy.dart';
import 'package:ishq/utils/error/failure.dart';

class AcceptRequestUC {
  final RequestRepository requestRepository;
  AcceptRequestUC({required this.requestRepository});

  Future<Either<Failure, void>> call(AcceptRequestparams params) {
    return requestRepository.acceptRequest(params.requestId);
  }
}

class AcceptRequestparams {
  final String requestId;
  AcceptRequestparams({required this.requestId});
}
