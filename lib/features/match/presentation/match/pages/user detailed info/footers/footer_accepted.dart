import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/loader/button_loader.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/match/presentation/match/bloc/match_bloc.dart';

import 'package:ishq/utils/constants/colors.dart';

class UserDetailsFooterAccepted extends StatelessWidget {
  const UserDetailsFooterAccepted({
    super.key,
    // required this.uid,
  });
  // final String uid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      child: Row(
        children: [
          //------------------------- SHARE -------------------------

          Flexible(
            flex: 3,
            child: BlocConsumer<MatchBloc, MatchState>(
              listener: (context, state) {
                if (state is RequestSuccess) {}
              },
              builder: (context, state) {
                if (state is RequestLoading) {
                  return ButtonLoader();
                }
                return ElevatedButton(
                  onPressed: () {
                    // context
                    //     .read<MatchBloc>()
                    //     .add();
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(JColor.white)),
                  child: Text(
                    "Message",
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
                "Share",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
