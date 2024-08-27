// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/features/match/presentation/chat/widgets/chat_tile.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_appbar_title.dart';

class ScnChat extends StatelessWidget {
  const ScnChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        title: AppbarTitle(title: 'Chats'),
        expandedHeight: 0,
        hasSliverChild: true,
        slivers: SliverList.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return ChatTile();
          },
        ),
      ),
    );
  }
}
