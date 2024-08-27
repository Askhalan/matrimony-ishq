// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/appbar/appbar_with_tabbar.dart';
import 'package:ishq/features/match/presentation/match/bloc/match_bloc.dart';
import 'package:ishq/features/match/presentation/match/widgets/user_card/user_list_tile.dart';
import 'package:ishq/features/match/presentation/match/widgets/user_card/user_list_loader.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_action_button.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ScnMatches extends StatefulWidget {
  const ScnMatches({super.key});

  @override
  State<ScnMatches> createState() => _ScnMatchesState();
}

class _ScnMatchesState extends State<ScnMatches> {
  @override
  void initState() {
    context.read<MatchBloc>().add(GetSentRequest());
    context.read<MatchBloc>().add(GetReceivedRequest());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: JAppbarWithTabs(
      title: AppbarTitle(
        title: 'Matches',
        subtitle: 'Everyone has a day',
      ),
      actions: [
        JActionButton(
          icon: Iconsax.sort,
          onTap: () {},
        )
      ],
      appbarPinned: true,
      tabs: [
        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Iconsax.arrow_up_3),
          ),
        ),
        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Iconsax.arrow_down),
          ),
        ),
        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Iconsax.user_search),
          ),
        ),
        Tab(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Iconsax.tag_user),
          ),
        ),
      ],
      length: 4,
      children: [
        //-------------------------------- SENT MATCH REQUESTS --------------------------------
        BlocBuilder<MatchBloc, MatchState>(
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
                    child: const Text('Currently you are not having request'));
              }
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue),
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    UserEntity user = state.users[index];
                    print(user.name);
                    return UserListTile(
                      user: user,
                    );
                  },
                ),
              );
            }
            return SizedBox();
          },
        ),

        //-------------------------------- RECEIVED MATCH REQUESTS --------------------------------

        BlocBuilder<MatchBloc, MatchState>(
          builder: (context, state) {
            if (state is RequestFetchingLoading) {
              return UserListLoader();
            }
            if (state is RequestLoadingError) {
              return Center(child: Text(state.message));
            }
            if (state is RecievedRequestLoaded) {
              log(state.users.isEmpty.toString());
              if (state.users.isEmpty) {
                return Center(
                    child: const Text('Currently you are not having request'));
              }
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: JSize.defaultPaddingValue),
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    UserEntity user = state.users[index];
                    print(user.name);
                    return UserListTile(
                      user: user,
                    );
                  },
                ),
              );
            }
            return SizedBox();
          },
        ),

        //-------------------------------- ACCEPTED MATCH REQUESTS --------------------------------

        Padding(
          padding: JSize.defaultPadding,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              // return UserListTile();
              return SizedBox();
            },
          ),
        ),
        Padding(
          padding: JSize.defaultPadding,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              // return UserListTile();
              return SizedBox();
            },
          ),
        ),
      ],
    ));
  }
}
