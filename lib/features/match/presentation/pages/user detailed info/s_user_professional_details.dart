// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/features/match/presentation/widgets/j_details_table_cell.dart';

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
        heading: 'Professional Details',
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Table(
              children: [
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'Employed in:',
                  ),
                  JDetailsTableCell(
                    text: user.employedIn,
                  ),
                ]),

                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'Occupation:',
                  ),
                  JDetailsTableCell(
                    text: user.occupation,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'organization:',
                  ),
                  JDetailsTableCell(
                    text: user.organization,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'Education:',
                  ),
                  JDetailsTableCell(
                    text: user.education,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'College:',
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
