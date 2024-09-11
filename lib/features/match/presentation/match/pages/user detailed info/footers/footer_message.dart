import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/match/presentation/chat/bloc/chat_bloc.dart';
import 'package:ishq/features/match/presentation/chat/pages/scn_chat_ui.dart';

import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class MessageUserDetailsFooter extends StatelessWidget {
  const MessageUserDetailsFooter({
    super.key,
    required this.user,
  });
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      child: Row(
        children: [
          //------------------------- SHARE -------------------------

          Flexible(
            flex: 3,
            child: BlocConsumer<ChatBloc, ChatState>(
              listener: (context, state) {
                if (state is ChatFound) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScnChatUi(user: user),
                      ));
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<ChatBloc>().add(StartChat(uid: user.uid!));
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(JColor.white)),
                  child: Text(
                    JTexts.Message,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
            ),
          ),
          JGap(),

          //------------------------- MESSAGE -------------------------

          Flexible(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(JColor.white)),
              child: Text(
                JTexts.Share,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
