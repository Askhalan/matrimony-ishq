import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/features/match/presentation/match/bloc/match_bloc/match_bloc.dart';
import 'package:ishq/features/match/presentation/match/pages/home/widgets/loaders/home_matches_sec_loader.dart';
import 'package:ishq/features/match/presentation/match/widgets/user_card/s_user_vertical_card.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecJobMatches extends StatelessWidget {
  const SecJobMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JSectionLabel(
          heading: 'Job Matches',
          action: JTexts.SEE_MORE,
          onTap: () {},
        ),
        SizedBox(
          height: JSize
              .vUserCardHeight, //cards height is given by the section height
          child: BlocBuilder<MatchBloc, MatchState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return HomeMatchesSecLoader();
              }
              if (state is HomeSuccess) {
                final allUsers = state.maritalStatusMatches;
                return allUsers.isEmpty
                    ? Center(child: Text(JTexts.MATCHES_EMPTY_MESSAGE))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return UserVerticalCard(
                            user: allUsers[index],
                          );
                        },
                      );
              }
              if (state is HomeFailure) {
                return Center(child: Text(state.message));
              }
              return SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
