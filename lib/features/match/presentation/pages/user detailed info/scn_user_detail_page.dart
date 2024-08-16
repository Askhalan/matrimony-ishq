// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/core/common/widgets/spaces/gap.dart';
import 'package:ishq/core/common/widgets/spaces/gap_2.dart';
import 'package:ishq/features/match/presentation/pages/user%20detailed%20info/s_more_user_photos.dart';
import 'package:ishq/features/match/presentation/pages/user%20detailed%20info/s_user_details_appbar_footer.dart';
import 'package:ishq/features/match/presentation/pages/user%20detailed%20info/s_user_detais_appbar_header.dart';
import 'package:ishq/features/match/presentation/pages/user%20detailed%20info/s_user_professional_details.dart';
import 'package:ishq/features/match/presentation/pages/user%20detailed%20info/s_userbasic_details.dart';
import 'package:ishq/features/match/presentation/widgets/j_details_table_cell.dart';
import 'package:ishq/utils/constants/sizes.dart';

class ScnUserDetails extends StatelessWidget {
  const ScnUserDetails({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JAppbar(
        centerTitle: true,
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
              icon: Icon(Iconsax.heart_add))
        ],
        // ---------------------------------- APPBAR HEADER ---------------------------------

        flexibleSpaceContent: UserDetailsAppbarHeader(
          user: user,
        ),

        //----------------------------------- APPBAR FOOTER ---------------------------------

        footerContent: UserDetailsAppbarFooter(),

        //---------------------------------------- BODY -------------------------------------
        body: SingleChildScrollView(
          child: Padding(
            padding: JSize.defaultPadding * 0.5,
            child: Column(
              children: [
                //-------------------------- Photos -----------------------------
                JGap(),
                SMoreUserPhotos(user: user),
                //----------------------- Basic Details--------------------------
                JGap2(),
                SUserbasicDetails(user: user),
                //-------------------- Professional Details----------------------
                JGap2(),
                SUserProfessionalDetails(user: user),
                //------------------------ Family Details------------------------
                JGap2(),
                SectionWraperContainer(
                    headerNeeded: true,
                    heading: 'Family Details',
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Table(
                          children: [
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: 'Family Type',
                              ),
                              JDetailsTableCell(
                                text: user.familyType,
                              ),
                            ]),
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: 'Values:',
                              ),
                              JDetailsTableCell(
                                text: user.familyValues,
                              ),
                            ]),
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: 'Status:',
                              ),
                              JDetailsTableCell(
                                text: user.familyValues,
                              ),
                            ]),
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: 'About:',
                              ),
                              JDetailsTableCell(
                                text: user.familyAbout,
                              ),
                            ]),
                          ],
                        ),
                      )
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
