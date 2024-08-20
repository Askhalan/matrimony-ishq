// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/features/auth/presentation/profile/pages/edit_profile/widgets/edit_other_profile_details.dart';
import 'package:ishq/features/auth/presentation/profile/pages/edit_profile/widgets/edit_profile_appbar_header.dart';

class ScnEditProfile extends StatelessWidget {
  const ScnEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        footerPinned: true,
        floating: true,
        showBackArrow: false,
        footerMaxHeight: 20,
        expandedHeight: 250,

        // ---------------------------------- APPBAR HEADER ---------------------------------

        flexibleSpaceContent: EditProfileAppbarHeader(),

        //---------------------------------------- BODY -------------------------------------
        body: SingleChildScrollView(
          child: Column(
            children: [
              EditProfileOtherDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
