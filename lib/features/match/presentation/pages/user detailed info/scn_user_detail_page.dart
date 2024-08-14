// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/features/match/presentation/pages/user%20detailed%20info/s_user_detais_appbar_header.dart';

class ScnUserDetails extends StatelessWidget {
  const ScnUserDetails({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        footerPinned: false,
        floating: false,
        showBackArrow: false,
        footerMaxHeight: 80,
        expandedHeight: 220,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, Routes.settingsScn);
              },
              icon: Icon(Icons.settings))
        ],
        // ---------------------------------- APPBAR HEADER ---------------------------------

        flexibleSpaceContent: UserDetailsAppbarHeader(user: user,),

        //----------------------------------- APPBAR FOOTER ---------------------------------

        // footerContent: ProfileAppbarFooter(),

        //---------------------------------------- BODY -------------------------------------
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ProfileOtherDetails()
              
            ],
          ),
        ),
      ),
    );
  }
}