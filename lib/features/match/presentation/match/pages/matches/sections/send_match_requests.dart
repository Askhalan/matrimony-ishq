// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/match/presentation/match/bloc/match_bloc/match_bloc.dart';
import 'package:ishq/features/match/presentation/match/widgets/user_card/user_list_loader.dart';
import 'package:ishq/features/match/presentation/match/widgets/user_card/user_list_tile.dart';
import 'package:ishq/utils/constants/enums.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SendMatchRequests extends StatelessWidget {
  const SendMatchRequests({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(
      builder: (context, state) {
        if (state is RequestFetchingLoading) {
          return UserListLoader();
        }
        if (state is RequestLoadingError) {
          return Center(child: Text(state.message));
        }
        if (state is SentRequestLoaded) {
          if (state.users.isEmpty) {
            return Center(
                child: const Text(JTexts.requestRecivedEmpty));
          }
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue),
            child: ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                UserEntity user = state.users[index];
    
                return UserListTile(
                  footerStatus: FooterStatus.cancel,
                  user: user,
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
