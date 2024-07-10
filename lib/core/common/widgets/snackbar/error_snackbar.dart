import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';

class ErrorSnackBar extends StatelessWidget {
  final String message;
  const ErrorSnackBar({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: JColor.error,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(Icons.info, color: Colors.white),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
