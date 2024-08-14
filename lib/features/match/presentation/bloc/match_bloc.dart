import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/age_match_uc.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/marital_status_match_uc.dart';
import 'package:ishq/features/match/domain/usecases/get_all_users.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final GetAllUsersUC _getAllUsersUC;
  final MatchAgeUC _matchAgeUC;
  final MatchMaritalStatusUC _matchMaritalStatusUC;
  MatchBloc({
    required GetAllUsersUC getAllUsersUC,
    required MatchAgeUC matchAgeUC,
    required MatchMaritalStatusUC matchMaritalStatusUC,
  })  : _getAllUsersUC = getAllUsersUC,
        _matchAgeUC = matchAgeUC,
        _matchMaritalStatusUC = matchMaritalStatusUC,
        super(MatchInitial()) {
    on<GetAllusers>(_onGetAllUser);
    on<LoadAllCategories>(_onLoadAllCategeories);
  }


 @override
  void onTransition(Transition<MatchEvent, MatchState> transition) {
    super.onTransition(transition);

    // Perform an action when transitioning to ProfileSuccess state
    if (transition.nextState is FetchUsersSuccessfull) {
      
    }
    
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
    final ageMatches = await _matchAgeUC(EmptyParams());
    final locationMatches = await _matchMaritalStatusUC(EmptyParams());
    ageMatches.fold((l) => emit(HomeFailure(message: l.message)), (ageMatches) {
      locationMatches.fold((l) => emit(HomeFailure(message: l.message)),
          (maritalStatusMatches) {
        emit(HomeSuccess(
          ageMatches: ageMatches,
          maritalStatusMatches: maritalStatusMatches,
        ));
      });
    });
  }
}
