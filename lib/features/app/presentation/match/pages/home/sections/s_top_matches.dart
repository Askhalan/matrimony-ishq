import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/features/app/presentation/match/bloc/match_bloc/match_bloc.dart';
import 'package:ishq/features/app/presentation/match/pages/home/widgets/loaders/w_top_match_loader.dart';
import 'package:ishq/features/app/presentation/match/widgets/w_card_horizondal.dart';
import 'package:ishq/features/app/presentation/match/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecTopMatches extends StatelessWidget {
  const SecTopMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //-------------------------------- Section Label --------------------------------
        JSectionLabel(
          heading: 'All Users',
          action: JTexts.SEE_MORE,
          onTap: () {},
        ),

        //-------------------------------- Carousel --------------------------------
        SizedBox(
         
          height: 180,
          child: BlocBuilder<MatchBloc, MatchState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return TopMatchCardLoader();
                  },
                );
              }
              if (state is HomeSuccess) {
                final allUsers = state.allUsers;
                return allUsers.isEmpty
                    ? Center(child: Text(JTexts.MATCHES_EMPTY_MESSAGE))
                    : Swiper(
                        itemCount: allUsers.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: WUserCardHorizondal(
                              user: allUsers[index],
                            ),
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
