// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';

class ScnChatUi extends StatelessWidget {
  const ScnChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        title: Row(
          children: [CircleAvatar(), Text('Username')],
        ),
        expandedHeight: 0,
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return  ;
          },
        ),
      ),
    );
  }
}
