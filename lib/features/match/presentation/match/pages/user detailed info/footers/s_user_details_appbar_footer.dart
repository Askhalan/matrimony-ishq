import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/loader/button_loader.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/match/presentation/match/bloc/match_bloc.dart';

import 'package:ishq/utils/constants/colors.dart';

class UserDetailsAppbarFooter extends StatelessWidget {
  const UserDetailsAppbarFooter({
    super.key,
    required this.uid,
  });
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      child: Row(
        children: [
          //------------------------- EDIT PROFILE -------------------------q

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
                    context
                        .read<MatchBloc>()
                        .add(MatchSendRequest(requestedId: uid));
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(JColor.white)),
                  child: Text(
                    "Send Request",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
            ),
          ),
          JGap(),

          //------------------------- EDIT Preferences -------------------------

          Flexible(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(JColor.white)),
              child: Text(
                "Save ",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),

          //-------------------------- UPGRADE PLAN --------------------------

          // Flexible(
          //   flex: 3,
          //   child: InkWell(
          //     onTap: () {},
          //     child: Container(
          //       height: 50,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //           gradient: JColor.goldGradient,
          //           borderRadius: BorderRadius.circular(JSize.borderRadLg)),
          //       child: Center(
          //         child: Text(
          //           "Upgrade plan",
          //           style: Theme.of(context).textTheme.bodyLarge,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // JGap(),

          //------------------------------ SHARE ------------------------------

          // Flexible(
          //   flex: 2,
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ButtonStyle(
          //         backgroundColor: WidgetStatePropertyAll(JColor.white)),
          //     child: Text(
          //       "Share",
          //       style: Theme.of(context).textTheme.bodyLarge,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
