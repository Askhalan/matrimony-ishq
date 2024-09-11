// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/core/common/widgets/spaces/gap_2.dart';
import 'package:ishq/features/match/presentation/match/pages/user%20detailed%20info/footers/footer_message.dart';
import 'package:ishq/features/match/presentation/match/pages/user%20detailed%20info/footers/footer_accept.dart';
import 'package:ishq/features/match/presentation/match/pages/user%20detailed%20info/footers/footer_withdraw.dart';
import 'package:ishq/features/match/presentation/match/pages/user%20detailed%20info/footers/w_send_footer.dart';
import 'package:ishq/features/match/presentation/match/pages/user%20detailed%20info/s_user_detais_appbar_header.dart';
import 'package:ishq/features/match/presentation/match/pages/user%20detailed%20info/s_user_professional_details.dart';
import 'package:ishq/features/match/presentation/match/pages/user%20detailed%20info/s_userbasic_details.dart';
import 'package:ishq/features/match/presentation/match/widgets/j_details_table_cell.dart';
import 'package:ishq/utils/constants/enums.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class ScnUserDetails extends StatelessWidget {
  ScnUserDetails({
    super.key,
    required this.user,
    required this.footerStatus,
  });
  final UserEntity user;
  Widget footerContent = SizedBox();
  final FooterStatus footerStatus;

  @override
  Widget build(BuildContext context) {
    switch (footerStatus) {
      case FooterStatus.send:
        footerContent = SendUserDetailsAppbarFooter(
          uid: user.uid!,
        );
        break;
      case FooterStatus.accept:
        footerContent = AcceptUserDetailsFooter(
          uid: user.uid!,
        );
        break;
      case FooterStatus.cancel:
        footerContent = WithdrawUserDetailsFooter();
        break;

      case FooterStatus.chat:
        footerContent = MessageUserDetailsFooter(
          user: user,
        );
        break;
    }
    return Scaffold(
      body: JAppbar(
        centerTitle: true,
        footerPinned: false,
        floating: false,
        showBackArrow: false,
        footerMaxHeight: 80,
        expandedHeight: 220,
        actions: [IconButton(onPressed: () {}, icon: Icon(Iconsax.heart_add))],
        // ---------------------------------- APPBAR HEADER ---------------------------------

        flexibleSpaceContent: UserDetailsAppbarHeader(
          user: user,
        ),

        //----------------------------------- APPBAR FOOTER ---------------------------------

        footerContent: footerContent,

        //---------------------------------------- BODY -------------------------------------
        body: SingleChildScrollView(
          child: Padding(
            padding: JSize.defaultPadding * 0.5,
            child: Column(
              children: [
                //-------------------------- Photos -----------------------------
                // JGap(),
                // SMoreUserPhotos(user: user),
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
                    heading: JTexts.FAMILY_DETAILS,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Table(
                          children: [
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: JTexts.FAMILY_TYPE,
                              ),
                              JDetailsTableCell(
                                text: user.familyType,
                              ),
                            ]),
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: JTexts.FAMILY_VALUES,
                              ),
                              JDetailsTableCell(
                                text: user.familyValues,
                              ),
                            ]),
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: JTexts.FAMILY_STATUS,
                              ),
                              JDetailsTableCell(
                                text: user.familyValues,
                              ),
                            ]),
                            // ---------------------------------
                            TableRow(children: [
                              JDetailsTableCell(
                                text: JTexts.ABOUT_FAMILY,
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
