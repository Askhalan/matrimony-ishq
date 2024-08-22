import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class SendRequestUC {
  final MatchRepository matchRepository;
  SendRequestUC({required this.matchRepository});

  Future<Either<Failure, void>> call(RequestParams params) {
    return matchRepository.sendRequest(
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
