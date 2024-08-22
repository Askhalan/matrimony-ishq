// ignore_for_file: unused_field

import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/age_match_uc.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/marital_status_match_uc.dart';
import 'package:ishq/features/match/domain/usecases/get_all_users.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/send_request_uc.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final GetAllUsersUC _getAllUsersUC;
  final MatchAgeUC _matchAgeUC;
  final MatchMaritalStatusUC _matchMaritalStatusUC;
  final SendRequestUC _sendRequestUC;
  MatchBloc(
      {required GetAllUsersUC getAllUsersUC,
      required MatchAgeUC matchAgeUC,
      required MatchMaritalStatusUC matchMaritalStatusUC,
      required SendRequestUC sendRequestUC})
      : _getAllUsersUC = getAllUsersUC,
        _matchAgeUC = matchAgeUC,
        _matchMaritalStatusUC = matchMaritalStatusUC,
        _sendRequestUC = sendRequestUC,
        super(MatchInitial()) {
    on<GetAllusers>(_onGetAllUser);
    on<LoadAllCategories>(_onLoadAllCategeories);
    on<MatchSendRequest>(_onSendRequest);
  }

  @override
  void onTransition(Transition<MatchEvent, MatchState> transition) {
    super.onTransition(transition);

    // Perform an action when transitioning to ProfileSuccess state
    if (transition.nextState is FetchUsersSuccessfull) {}
  }

  Future<void> _onGetAllUser(
      GetAllusers event, Emitter<MatchState> emit) async {
    emit(FetchUserLoading());
    final res = await _getAllUsersUC(EmptyParams());

    res.fold((l) => emit(FetchUsersFailure(l.message)), (r) {
      emit(FetchUsersSuccessfull(r));
    });
  }

  Future<void> _onLoadAllCategeories(
      LoadAllCategories event, Emitter<MatchState> emit) async {
    emit(HomeLoading());
    final allUsers = await _matchAgeUC(EmptyParams());
    final ageMatches = await _matchAgeUC(EmptyParams());
   
    final locationMatches = await _matchMaritalStatusUC(EmptyParams());
    ageMatches.fold((l) => emit(HomeFailure(message: l.message)), (ageMatches) {
      locationMatches.fold((l) => emit(HomeFailure(message: l.message)),
          (maritalStatusMatches) {
        allUsers.fold(
          (l) => emit(HomeFailure(message: l.message)),
          (allUsers) {
            emit(HomeSuccess(
              allUsers: allUsers,
              ageMatches: ageMatches,
              maritalStatusMatches: maritalStatusMatches,
            ));
          },
        );
      });
    });
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
