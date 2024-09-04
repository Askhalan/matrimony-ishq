// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/features/match/presentation/chat/bloc/chat_bloc.dart';
import 'package:ishq/utils/constants/sizes.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue * 0.5),
        child: DashChat(
          messageListOptions: MessageListOptions(),
          inputOptions: InputOptions(
            alwaysShowSend: true,
          ),
          currentUser: currentUser!,
          onSend: (message) {
            context
                .read<ChatBloc>()
                .add(SendMessage(uid: widget.user.uid!, message: message));
          },
          messages: [],
        ),
      ),
    );
  }
}
