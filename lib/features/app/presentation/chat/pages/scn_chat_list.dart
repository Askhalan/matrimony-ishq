import 'package:flutter/material.dart';

import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/features/app/domain/entities/chat_history_entity.dart';
import 'package:ishq/features/app/presentation/chat/widgets/chat_tile.dart';
import 'package:ishq/features/app/presentation/match/widgets/w_appbar_title.dart';
import 'package:ishq/features/app/domain/usecases/chat_usecases/get_all_chats_uc.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart'; // Assuming this is where the service locator is

class ScnChat extends StatelessWidget {
  const ScnChat({super.key});

  @override
  Widget build(BuildContext context) {
    final getAllChatsUC = serviceLocator<GetAllChatsUC>();

    return Scaffold(
      body: JAppbar(
        title: AppbarTitle(title: 'Chats'),
        expandedHeight: 0,
        hasSliverChild: true,
        slivers: StreamBuilder<List<ChatHistoryItem>>(
          stream: getAllChatsUC(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ChatHistoryItem>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              debugPrint('Error: ${snapshot.error}');
              return SliverFillRemaining(
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SliverFillRemaining(
                child: Center(child: Text('No chats available')),
              );
            } else {
              final chatItem = snapshot.data!;
              return SliverList.builder(
                itemCount: chatItem.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = chatItem[index];

                  return ChatTile(
                    chat: data.chat,
                    otherUser: data.otherUser,
                  ); // Pass the chat model to ChatTile
                },
              );
            }
          },
        ),
      ),
    );
  }
}
