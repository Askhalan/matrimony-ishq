// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/widgets/containers/w_section_wraper_container.dart';
import 'package:ishq/features/match/presentation/match/widgets/j_details_table_cell.dart';

class SUserbasicDetails extends StatelessWidget {
  const SUserbasicDetails({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SectionWraperContainer(
        headerNeeded: true,
        heading: 'Basic Details',
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Table(
              children: [
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'Height:',
                  ),
                  JDetailsTableCell(
                    text: '147',
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'Country:',
                  ),
                  JDetailsTableCell(
                    text: user.country,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'State:',
                  ),
                  JDetailsTableCell(
                    text: user.state,
                  ),
                ]),
                // ---------------------------------
                TableRow(children: [
                  JDetailsTableCell(
                    text: 'City:',
                  ),
                  JDetailsTableCell(
                    text: user.city,
                  ),
                ]),
              ],
            ),
          )
        ]);
  }
}
