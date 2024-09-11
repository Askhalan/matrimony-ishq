// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/features/match/presentation/match/widgets/j_details_table_cell.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class SUserProfessionalDetails extends StatelessWidget {
  const SUserProfessionalDetails({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SectionWraperContainer(
        headerNeeded: true,
        heading: JTexts.ProfessionalDetails,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Table(
              children: [
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: JTexts.EmployedIn,
                  ),
                  JDetailsTableCell(
                    text: user.employedIn,
                  ),
                ]),

                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: JTexts.Occupation,
                  ),
                  JDetailsTableCell(
                    text: user.occupation,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: JTexts.organization,
                  ),
                  JDetailsTableCell(
                    text: user.organization,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: JTexts.Education,
                  ),
                  JDetailsTableCell(
                    text: user.education,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: JTexts.College,
                  ),
                  JDetailsTableCell(
                    text: user.college,
                  ),
                ]),
              ],
            ),
          )
        ]);
  }
}
