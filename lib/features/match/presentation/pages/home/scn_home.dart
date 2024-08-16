
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/features/match/presentation/pages/home/widgets/s_appbar_title.dart';
// import 'package:ishq/features/match/presentation/pages/home/widgets/s_family_matches.dart';
import 'package:ishq/features/match/presentation/pages/home/widgets/s_home_flexiblespace.dart';
import 'package:ishq/features/match/presentation/pages/home/widgets/s_lifestyle_matches.dart';
import 'package:ishq/features/match/presentation/pages/home/widgets/s_professional_matches.dart';
import 'package:ishq/features/match/presentation/pages/home/widgets/s_success_story.dart';
import 'package:ishq/features/match/presentation/pages/home/widgets/s_top_matches.dart';
import 'package:ishq/features/match/presentation/widgets/w_action_button.dart';

class ScnHome extends StatelessWidget {
  const ScnHome({super.key});

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
        expandedHeight: CurrentUserPreferences().isPrefAdded ? 180 : 0,
        title: HomeAppbarTitle(),
        flexibleSpaceContent: const HomeFlexibleSpace(),
        body: const Column(children: [
          //--------------------------- TOP MATCHES ---------------------------
          SecTopMatches(), // Temp as All Users
          JGap(h: 5)
        ]),
        scrollChild: Column(
          children: [
            //------------------------ PROFESSIONAL MATCHES -------------------

            SecProfessionalMatches(), //Temp as age Match

            //------------------------ LIFESTYLE MATCHES ---------------------

            SecLifestyleMatches(),

            //------------------------ SUCCESS STORY ----------------------

            SecSuccessStory(),

            //------------------------ FAMILY MATCHES ---------------------

            // SecFamilyMatches(),
            JGap(
              h: 70,
            )
          ],
        ),
      ),
    );
  }
}
