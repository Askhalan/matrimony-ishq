// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/appbar/appbar_with_tabbar.dart';
import 'package:ishq/features/match/presentation/widgets/user_list_tile.dart';
import 'package:ishq/features/match/presentation/widgets/w_action_button.dart';
import 'package:ishq/features/match/presentation/widgets/w_appbar_title.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ScnMatches extends StatelessWidget {
  const ScnMatches({super.key});

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
      // expandedHeight: 0,
      footerMaxHeight: 200,
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
        Padding(
          padding: JSize.defaultPadding,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return UserListTile(
                name: 'Hana Sherin',
                age: '22',
                place: 'Kozhicode',
              );
            },
          ),
        ),
         Padding(
          padding: JSize.defaultPadding,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return UserListTile(
                name: 'Hana Sherin',
                age: '22',
                place: 'Kozhicode',
              );
            },
          ),
        ),
         Padding(
          padding: JSize.defaultPadding,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return UserListTile(
                name: 'Hana Sherin',
                age: '22',
                place: 'Kozhicode',
              );
            },
          ),
        ),
         Padding(
          padding: JSize.defaultPadding,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return UserListTile(
                name: 'Hana Sherin',
                age: '22',
                place: 'Kozhicode',
              );
            },
          ),
        ),
      ],
    ));
  }
}


