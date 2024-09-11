// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/match/domain/usecases/match_usecases/categeorize_users_uc.dart';
import 'package:ishq/features/match/domain/usecases/match_usecases/get_all_users.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/accept_request_uc.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/get_accepted_request_suc.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/get_received_request_suc.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/get_sent_request_suc.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/send_request_uc.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(MatchInitial()) {
    on<InitializeMatch>(_onInitializeMatch);
    on<GetAllusers>(_onGetAllUser);
    on<LoadAllCategories>(_onLoadAllCategeories);
    on<MatchSendRequest>(_onSendRequest);
    on<AcceptRequest>(_onAcceptRequest);
    on<GetSentRequest>(_onGetSentRequest);
    on<GetReceivedRequest>(_onGetReceivedRequest);
    on<GetAcceptedRequest>(_onGetAcceptedRequest);
    add(InitializeMatch()); // initializing necessary events
  }

//----------------------------- INITIALIZATION ----------------------------

  void _onInitializeMatch(InitializeMatch event, Emitter<MatchState> emit) {
    add(LoadAllCategories());
  }

//----------------------------- GET ALL USERS -----------------------------

  _onGetAllUser(GetAllusers event, Emitter<MatchState> emit) async {
    emit(FetchUserLoading());
    // Get use case instance
    final getAllUsersUC = serviceLocator<GetAllUsersUC>();
    final res = await getAllUsersUC(EmptyParams());

    res.fold((l) => emit(FetchUsersFailure(l.message)), (r) {
      emit(FetchUsersSuccessfull(r));
    });
  }

//-------------------------- LOAD ALL CATEGEORIES -------------------------

  _onLoadAllCategeories(
      LoadAllCategories event, Emitter<MatchState> emit) async {
    emit(HomeLoading());
    // Get use case instance
    final categorizeUsersUC = serviceLocator<CategorizeUsersUC>();
    final result = await categorizeUsersUC(EmptyParams());

    result.fold(
      (failure) => emit(HomeFailure(message: failure.message)),
      (categorizedUsers) => emit(HomeSuccess(
        allUsers: categorizedUsers['allUsers'] ?? [],
        ageMatches: categorizedUsers['ageMatch'] ?? [],
        maritalStatusMatches: categorizedUsers['maritalStatusMatch'] ?? [],
        jobMatches: categorizedUsers['jobMatch'] ?? [],
      )),
    );
  }

//------------------------------ SEND REQUEST ----------------------------

  _onSendRequest(MatchSendRequest event, Emitter<MatchState> emit) async {
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

  _onAcceptRequest(AcceptRequest event, Emitter<MatchState> emit) async {
    emit(RequestLoading());
    final acceptRequestUC = serviceLocator<AcceptRequestUC>();
    final result = await acceptRequestUC(
        AcceptRequestparams(requestId: event.requestedUserUid));
    result.fold((failure) => emit(RequestError(failure.message)),
        (r) => emit(RequestSuccess()));
  }

//----------------------------- GET SENT REQUEST --------------------------

  Future<void> _onGetSentRequest(
      GetSentRequest event, Emitter<MatchState> emit) async {
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
      GetReceivedRequest event, Emitter<MatchState> emit) async {
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
      GetAcceptedRequest event, Emitter<MatchState> emit) async {
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





// Explanation:

// emit.forEach: This method is perfect for handling streams in Bloc because it 
// listens to a stream and emits states whenever new data arrives. It also handles
//  errors that may occur during stream processing.

// onData: Defines what happens with the data emitted by the stream. You use this 
// to map the stream data (which in your case is an Either type) to a specific state.

// onError: Handles any errors that might occur during stream processing, allowing 
// you to emit an error state if necessary.

// For more notes : -> Notes -> stream_listning_bloc.notes