import 'dart:async';
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
    on<GetAllusers>(_onGetAllUser);
    on<LoadAllCategories>(_onLoadAllCategeories);
    on<MatchSendRequest>(_onSendRequest);
    on<AcceptRequest>(_onAcceptRequest);
    on<GetSentRequest>(_onGetSentRequest);
    on<GetReceivedRequest>(_onGetReceivedRequest);
    on<GetAcceptedRequest>(_onGetAcceptedRequest);
  }

//------------------------------ TRANSITION ------------------------------
  @override
  void onTransition(Transition<MatchEvent, MatchState> transition) {
    super.onTransition(transition);
    // Perform an action when transitioning to ProfileSuccess state
    if (transition.nextState is FetchUsersSuccessfull) {}
  }

//----------------------------- GET ALL USERS -----------------------------

  Future<void> _onGetAllUser(
      GetAllusers event, Emitter<MatchState> emit) async {
    emit(FetchUserLoading());
    // Get use case instance
    final getAllUsersUC = serviceLocator<GetAllUsersUC>();
    final res = await getAllUsersUC(EmptyParams());

    res.fold((l) => emit(FetchUsersFailure(l.message)), (r) {
      emit(FetchUsersSuccessfull(r));
    });
  }

//-------------------------- LOAD ALL CATEGEORIES -------------------------

  Future<void> _onLoadAllCategeories(
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

  Future<void> _onSendRequest(
      MatchSendRequest event, Emitter<MatchState> emit) async {
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

  FutureOr<void> _onAcceptRequest(
      AcceptRequest event, Emitter<MatchState> emit) async {
    emit(RequestLoading());
    final acceptRequestUC = serviceLocator<AcceptRequestUC>();
    final result = await acceptRequestUC(AcceptRequestparams(requestId: ''));
    result.fold((failure) => emit(RequestError(failure.message)),
        (r) => emit(RequestSuccess()));
  }

//----------------------------- GET SEND REQUEST --------------------------

  FutureOr<void> _onGetSentRequest(
      GetSentRequest event, Emitter<MatchState> emit) {
    emit(RequestFetchingLoading());
    final getSendRequestUC = serviceLocator<GetSentRequestsStreamUC>();
    final stream = getSendRequestUC(EmptyParams());
    stream.listen((either) {
      either.fold(
        (failure) => emit(RequestError(failure.message)),
        (userList) => emit(SentRequestLoaded(users: userList)),
      );
    });
  }

//--------------------------- GET RECEIVED REQUEST ------------------------

  FutureOr<void> _onGetReceivedRequest(
      GetReceivedRequest event, Emitter<MatchState> emit) {
    emit(RequestFetchingLoading());
    final getReceivedRequestUC = serviceLocator<GetReceivedRequestsStreamUC>();
    final stream = getReceivedRequestUC(EmptyParams());
    stream.listen((either) {
      either.fold(
        (failure) => emit(RequestError(failure.message)),
        (userList) => emit(SentRequestLoaded(users: userList)),
      );
    });
  }

//--------------------------- GET ACCEPTED REQUEST ------------------------

  FutureOr<void> _onGetAcceptedRequest(
      GetAcceptedRequest event, Emitter<MatchState> emit) {
    emit(RequestFetchingLoading());
    final getAcceptedRequestUC = serviceLocator<GetAcceptedRequestsStreamUC>();
    final stream = getAcceptedRequestUC(EmptyParams());
    stream.listen((either) {
      either.fold(
        (failure) => emit(RequestError(failure.message)),
        (userList) => emit(SentRequestLoaded(users: userList)),
      );
    });
  }
}
