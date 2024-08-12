

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/features/match/presentation/bloc/match_bloc.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/s_user_vertical_card.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/vertical_user_card_loader.dart';
import 'package:ishq/features/match/presentation/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecProfessionalMatches extends StatelessWidget {
  const SecProfessionalMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JSectionLabel(
          // heading: JTexts.PROFESSIONAL_MATCHES,
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
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return VerticalUserCardLoader();
                  },
                );
              }
              if (state is HomeSuccess) {
                final allUsers = state.ageMatches;
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
              if(state is HomeFailure){
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
