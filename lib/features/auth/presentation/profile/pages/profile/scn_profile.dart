// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/profile/pages/profile/widgets/s_other_profile_details.dart';
import 'package:ishq/features/auth/presentation/profile/pages/profile/widgets/s_profile_appbar_footer.dart';
import 'package:ishq/features/auth/presentation/profile/pages/profile/widgets/s_profile_appbar_header.dart';

class ScnProfile extends StatelessWidget {
  const ScnProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        footerPinned: true,
        floating: true,
        showBackArrow: false,
        footerMaxHeight: 100,
        expandedHeight: 250,

        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.settingsScn);
              },
              icon: Icon(Icons.settings))
        ],
        // ---------------------------------- APPBAR HEADER ---------------------------------

        flexibleSpaceContent: ProfileAppbarHeader(),

        //----------------------------------- APPBAR FOOTER ---------------------------------

        footerContent: ProfileAppbarFooter(),

        //---------------------------------------- BODY -------------------------------------
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileOtherDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
