// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/app/domain/usecases/match_usecases/categeorize_users_uc.dart';
import 'package:ishq/features/app/domain/usecases/match_usecases/get_all_users.dart';
part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(MatchInitial()) {
    on<InitializeMatch>(_onInitializeMatch);
    on<GetAllusers>(_onGetAllUser);
    on<LoadAllCategories>(_onLoadAllCategeories);
    
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