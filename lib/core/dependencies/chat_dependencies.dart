import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/app/data/datasources/chat_datasource.dart';
import 'package:ishq/features/app/data/repositories/chat_repository_impl.dart';
import 'package:ishq/features/app/domain/repositories/chat_repository.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/create_chat_uc.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/get_all_chats_uc.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/load_chat_messages_uc.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/send_message_uc.dart';
import 'package:ishq/features/app/presentation/chat/bloc/chat_bloc.dart';

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
      ..registerFactory(() => GetAllChatsUC(chatRepository: serviceLocator()))

//-------------------------------------------------------------------------------------------
      ..registerLazySingleton(() => ChatBloc());
  }
}
