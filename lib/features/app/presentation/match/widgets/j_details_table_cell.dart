// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class JDetailsTableCell extends StatelessWidget {
  const JDetailsTableCell({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return TableCell(child: Text(text));
  }
}
