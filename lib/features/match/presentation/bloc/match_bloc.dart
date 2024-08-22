// ignore_for_file: unused_field

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/categeorize_users_uc.dart';
import 'package:ishq/features/match/domain/usecases/get_all_users.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/send_request_uc.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final GetAllUsersUC _getAllUsersUC;

  final CategorizeUsersUC _categorizeUsersUC;
  final SendRequestUC _sendRequestUC;
  MatchBloc(
      {required GetAllUsersUC getAllUsersUC,
      required CategorizeUsersUC categorizeUsersUC,
      required SendRequestUC sendRequestUC})
      : _getAllUsersUC = getAllUsersUC,
        _categorizeUsersUC = categorizeUsersUC,
        _sendRequestUC = sendRequestUC,
        super(MatchInitial()) {
    on<GetAllusers>(_onGetAllUser);
    on<LoadAllCategories>(_onLoadAllCategeories);
    on<MatchSendRequest>(_onSendRequest);
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
    final res = await _getAllUsersUC(EmptyParams());

    res.fold((l) => emit(FetchUsersFailure(l.message)), (r) {
      emit(FetchUsersSuccessfull(r));
    });
  }

//-------------------------- LOAD ALL CATEGEORIES -------------------------

  Future<void> _onLoadAllCategeories(
      LoadAllCategories event, Emitter<MatchState> emit) async {
    emit(HomeLoading());
    final result = await _categorizeUsersUC(EmptyParams());

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

  FutureOr<void> _onSendRequest(
      MatchSendRequest event, Emitter<MatchState> emit) async {
    emit(RequestLoading());
    final result = await _sendRequestUC(RequestParams(
      requesterId: CurrentUser().uid!,
      requestedId: event.requestedId,
      timestamp: DateTime.now(),
      status: 'pending',
    ));

    result.fold((failure) => emit(MatchError(failure.message)),
        (r) => emit(RequestSendSuccess()));
  }

  
}
