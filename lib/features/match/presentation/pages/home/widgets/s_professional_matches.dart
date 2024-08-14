import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/match/data/datasources/match_datasource.dart';
import 'package:ishq/features/match/data/repositories/match_repository_impl.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/age_match_uc.dart';
import 'package:ishq/features/match/presentation/bloc/match_bloc.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/s_user_vertical_card.dart';
import 'package:ishq/features/match/presentation/widgets/user_card/vertical_user_card_loader.dart';
import 'package:ishq/features/match/presentation/widgets/w_section_label.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SecProfessionalMatches extends StatelessWidget {
  SecProfessionalMatches({
    super.key,
  });
  final MatchDataSourceImpl dataSource =
      MatchDataSourceImpl(db: serviceLocator());
     final MatchRepositoryImpl agee = MatchRepositoryImpl(matchDataSource: serviceLocator());
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
                final ageMatchUsers = state.ageMatches;
                return ageMatchUsers.isEmpty
                    ? Center(child: Text(JTexts.MATCHES_EMPTY_MESSAGE))
                    : FutureBuilder(
                        future: agee.fetchAgeMatchUsers(),
                        builder: (context, snapshot) {
                          if(snapshot.data!.isEmpty){
                            return Text('Yoy dont ahve any match here');
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ageMatchUsers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return UserVerticalCard(
                                user: ageMatchUsers[index],
                              );
                            },
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
