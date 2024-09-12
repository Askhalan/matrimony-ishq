import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/app/presentation/match/bloc/match_bloc/match_bloc.dart';
import 'package:ishq/features/app/presentation/match/pages/home/sections/appbar/s_appbar_title.dart';
import 'package:ishq/features/app/presentation/match/pages/home/sections/s_family_matches.dart';
import 'package:ishq/features/app/presentation/match/pages/home/sections/s_job_matches.dart';
import 'package:ishq/features/app/presentation/match/pages/home/sections/s_marital_status_matches.dart';
import 'package:ishq/features/app/presentation/match/pages/home/sections/s_age_matches.dart';
import 'package:ishq/features/app/presentation/match/pages/home/sections/s_success_story.dart';
import 'package:ishq/features/app/presentation/match/pages/home/sections/s_top_matches.dart';
import 'package:ishq/features/app/presentation/match/widgets/w_action_button.dart';

class ScnHome extends StatefulWidget {
  const ScnHome({super.key});

  @override
  State<ScnHome> createState() => _ScnHomeState();
}

class _ScnHomeState extends State<ScnHome> {
  @override
  void initState() {
   context.read<MatchBloc>().add(LoadAllCategories());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        actions: [
          JActionButton(
            icon: Iconsax.notification,
            onTap: () {},
          )
        ],
        showBackArrow: false,
        expandedHeight: 0,
        title: const HomeAppbarTitle(),
        // flexibleSpaceContent: const HomeFlexibleSpace(),
        body: const Column(children: [
          //--------------------------- TOP MATCHES ---------------------------
          SecTopMatches(), // Temp as All Users
          JGap(h: 5)
        ]),
        scrollChild: const Column(
          children: [
            //-------------------------- AGE MATCHES ------------------------

            SecAgeMatches(), 

            //-------------------- MARITAL STATUS MATCHES -------------------

            SecMaritalStatusMatches(),

            //--------------------------- JOB MATCHES -----------------------

            SecJobMatches(),

            //------------------------ SUCCESS STORY ------------------------

            SecSuccessStory(),

            //------------------------ FAMILY MATCHES -----------------------

            SecFamilyMatches(),
            JGap(
              h: 70,
            )
          ],
        ),
      ),
    );
  }
}

class InitializeMatchesEvent {
}
