import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/match/domain/repositories/request_repository%20copy.dart';
import 'package:ishq/utils/error/failure.dart';

class SendRequestUC {
  final RequestRepository requestRepository;
  SendRequestUC({required this.requestRepository});

  Future<Either<Failure, void>> call(RequestParams params) {
    return requestRepository.sendRequest(
      requestedId: params.requestedId,
      requesterId: params.requesterId,
      status: params.status,
      timestamp: params.timestamp,
    );
  }
}

class RequestParams {
  final String requesterId;
  final String requestedId;
  final DateTime timestamp;
  final String status;

  RequestParams({
    required this.requesterId,
    required this.requestedId,
    required this.timestamp,
    required this.status,
  });
}
