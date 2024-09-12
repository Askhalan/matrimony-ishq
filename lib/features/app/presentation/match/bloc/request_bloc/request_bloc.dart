import 'package:bloc/bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/accept_request_uc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/get_accepted_request_suc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/get_received_request_suc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/get_sent_request_suc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/send_request_uc.dart';
part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  RequestBloc() : super(RequestInitial()) {
    on<MatchSendRequest>(_onSendRequest);
    on<AcceptRequest>(_onAcceptRequest);
    on<GetSentRequest>(_onGetSentRequest);
    on<GetReceivedRequest>(_onGetReceivedRequest);
    on<GetAcceptedRequest>(_onGetAcceptedRequest);
  }

  //------------------------------ SEND REQUEST ----------------------------

  _onSendRequest(MatchSendRequest event, Emitter<RequestState> emit) async {
    emit(RequestLoading());

    // Get use case instance
    final sendRequestUC = serviceLocator<SendRequestUC>();
    final result = await sendRequestUC(RequestParams(
      requesterId: CurrentUser().uid!,
      requestedId: event.requestedId,
      timestamp: DateTime.now(),
      status: 'pending',
    ));

    result.fold((failure) => emit(RequestError(failure.message)),
        (r) => emit(RequestSuccess()));
  }

//------------------------------ ACCEPT REQUEST ---------------------------

  _onAcceptRequest(AcceptRequest event, Emitter<RequestState> emit) async {
    emit(RequestLoading());
    final acceptRequestUC = serviceLocator<AcceptRequestUC>();
    final result = await acceptRequestUC(
        AcceptRequestparams(requestId: event.requestedUserUid));
    result.fold((failure) => emit(RequestError(failure.message)),
        (r) => emit(RequestSuccess()));
  }

//----------------------------- GET SENT REQUEST --------------------------

  Future<void> _onGetSentRequest(
      GetSentRequest event, Emitter<RequestState> emit) async {
    emit(RequestFetchingLoading());
    final getSendRequestUC = serviceLocator<GetSentRequestsStreamUC>();
    final stream = getSendRequestUC(EmptyParams());

    await emit.forEach(
      stream,
      onData: (either) => either.fold(
        (failure) => RequestLoadingError(failure.message),
        (userList) {
          print("length from success  ${userList.length}");
          return SentRequestLoaded(users: userList);
        },
      ),
      onError: (error, stackTrace) => RequestLoadingError(error.toString()),
    );
  }

//--------------------------- GET RECEIVED REQUEST ------------------------

  Future<void> _onGetReceivedRequest(
      GetReceivedRequest event, Emitter<RequestState> emit) async {
    emit(RequestFetchingLoading());
    final getReceivedRequestUC = serviceLocator<GetReceivedRequestsStreamUC>();
    final stream = getReceivedRequestUC(EmptyParams());

    await emit.forEach(
      stream,
      onData: (either) => either
          .fold((failure) => RequestLoadingError(failure.message), (userList) {
        print("length from GET RECEIVED REQUEST success  ${userList.length}");
        return RecievedRequestLoaded(users: userList);
      }),
      onError: (error, stackTrace) => RequestLoadingError(error.toString()),
    );
  }

//--------------------------- GET ACCEPTED REQUEST ------------------------

  Future<void> _onGetAcceptedRequest(
      GetAcceptedRequest event, Emitter<RequestState> emit) async {
    emit(RequestFetchingLoading());
    final getAcceptedRequestUC = serviceLocator<GetAcceptedRequestsStreamUC>();
    final stream = getAcceptedRequestUC(EmptyParams());

    await emit.forEach(
      stream,
      onData: (either) => either.fold(
        (failure) => RequestLoadingError(failure.message),
        (userList) => AcceptedRequestLoaded(users: userList),
      ),
      onError: (error, stackTrace) => RequestLoadingError(error.toString()),
    );
  }
}
