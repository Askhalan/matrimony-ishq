import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,Widget content) {
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    content: content
  );

  ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(snackBar);
}
