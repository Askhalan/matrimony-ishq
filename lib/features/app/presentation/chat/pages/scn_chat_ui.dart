// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/app/domain/entities/chat_entity.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/load_chat_messages_uc.dart';
import 'package:ishq/features/app/presentation/chat/bloc/chat_bloc.dart';
import 'package:ishq/features/app/presentation/chat/widgets/chat_appbar.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';

class ScnChatUi extends StatefulWidget {
  const ScnChatUi({super.key, required this.user});
  final UserEntity user;

  @override
  State<ScnChatUi> createState() => _ScnChatUiState();
}

class _ScnChatUiState extends State<ScnChatUi> {
  ChatUser? currentUser, otherUser;

  @override
  void initState() {
    super.initState();

    currentUser = ChatUser(
      id: CurrentUser().uid!,
      firstName: CurrentUser().name,
    );
    otherUser = ChatUser(
        id: widget.user.uid!,
        firstName: widget.user.name,
        profileImage: widget.user.profileImage);
  }

  @override
  Widget build(BuildContext context) {
    final loadChatMessagesUC = serviceLocator<LoadChatMessagesUC>();
    return Scaffold(
      appBar:JChatAppbar(name: widget.user.name,image: widget.user.profileImage,),
      
      body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue * 0.5),
          child: StreamBuilder(
            stream: loadChatMessagesUC(
                LoadChatMessagesParams(uid: widget.user.uid!)),
            builder: (context, snapshot) {
              Chat? chat = snapshot.data;
              List<ChatMessage> messages = [];
              if (chat != null && chat.messages != null) {
                messages = DataHelper.generateChatMessagesList(
                    messages: chat.messages!,
                    currentUser: currentUser!,
                    otherUser: otherUser!);
              }
              return DashChat(
                messageListOptions: MessageListOptions(),
                messageOptions: MessageOptions(
                    timePadding: EdgeInsets.symmetric(horizontal: 0),
                    showOtherUsersName: false,
                    showOtherUsersAvatar: false,

                    // messagePadding:EdgeInsets.fromLTRB(11, 11, 25, 11) ,
                    showTime: true,
                    currentUserContainerColor:
                        const Color.fromARGB(177, 216, 151, 185),
                    currentUserTextColor: Color.fromARGB(255, 35, 35, 35)),
                inputOptions: InputOptions(
                  alwaysShowSend: true,
                ),
                currentUser: currentUser!,
                onSend: (message) {
                  context.read<ChatBloc>().add(
                      SendMessage(uid: widget.user.uid!, message: message));
                },
                messages: messages,
              );
            },
          )),
    );
  }
}
