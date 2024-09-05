// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/appbar/appbar_with_tabbar.dart';
import 'package:ishq/features/match/presentation/match/bloc/match_bloc.dart';
import 'package:ishq/features/match/presentation/match/pages/matches/sections/accepted_match_request.dart';
import 'package:ishq/features/match/presentation/match/pages/matches/sections/received_match_requests.dart';
import 'package:ishq/features/match/presentation/match/pages/matches/sections/send_match_requests.dart';
import 'package:ishq/features/match/presentation/match/widgets/w_appbar_title.dart';

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
      ],
      length: 3,
      children: [
        //-------------------------------- SENT MATCH REQUESTS --------------------------------

        SendMatchRequests(),

        //-------------------------------- RECEIVED MATCH REQUESTS --------------------------------

        ReceivedMatchRequests(),

        //-------------------------------- ACCEPTED MATCH REQUESTS --------------------------------

        AcceptedMatchRequest(),

        //-------------------------------- useless --------------------------------
        // Padding(
        //   padding: JSize.defaultPadding,
        //   child: ListView.builder(
        //     itemCount: 10,
        //     itemBuilder: (context, index) {
        //       // return UserListTile();
        //       return SizedBox();
        //     },
        //   ),
        // ),
      ],
    ));
  }
}