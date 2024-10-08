import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/features/app/presentation/match/bloc/match_bloc/match_bloc.dart';
import 'package:ishq/features/app/presentation/match/pages/home/widgets/loaders/home_matches_sec_loader.dart';
import 'package:ishq/features/app/presentation/match/widgets/user_card/s_user_vertical_card.dart';
import 'package:ishq/features/app/presentation/match/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecAgeMatches extends StatelessWidget {
  const SecAgeMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JSectionLabel(
         
          heading: 'Age Matches',
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
                final ageMatchUsers = state.ageMatches;
                return ageMatchUsers.isEmpty
                    ? Center(child: Text(JTexts.MATCHES_EMPTY_MESSAGE))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ageMatchUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return UserVerticalCard(
                            user: ageMatchUsers[index],
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
