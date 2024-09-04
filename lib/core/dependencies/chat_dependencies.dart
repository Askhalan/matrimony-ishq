import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/match/data/datasources/chat_datasource.dart';
import 'package:ishq/features/match/data/repositories/chat_repository_impl.dart';
import 'package:ishq/features/match/domain/repositories/chat_repository.dart';
import 'package:ishq/features/match/domain/usecases/chat_usecases/create_chat_uc.dart';
import 'package:ishq/features/match/domain/usecases/chat_usecases/load_chat_messages_uc.dart';
import 'package:ishq/features/match/domain/usecases/chat_usecases/send_message_uc.dart';
import 'package:ishq/features/match/presentation/chat/bloc/chat_bloc.dart';

class ChatDependencies {
  static void initChatData() {
    serviceLocator
      ..registerFactory<ChatDatasource>(() =>
          ChatDatasourceImpl(db: serviceLocator(), auth: serviceLocator()))

//-------------------------------------------------------------------------------------------

      ..registerFactory<ChatRepository>(
          () => ChatRepositoryImpl(chatDatasource: serviceLocator()))

//-------------------------------------------------------------------------------------------

      ..registerFactory(() => CreateChatUc(chatRepository: serviceLocator()))
      ..registerFactory(() => SendMessageUc(chatRepository: serviceLocator()))
      ..registerFactory(
          () => LoadChatMessagesUC(chatRepository: serviceLocator()))

//-------------------------------------------------------------------------------------------
      ..registerLazySingleton(() => ChatBloc());
  }
}
