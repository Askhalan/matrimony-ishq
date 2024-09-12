import 'package:flutter/material.dart';
import 'package:ishq/core/routes/routes.dart';

import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class ProfileAppbarFooter extends StatelessWidget {
  const ProfileAppbarFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          //--------------------------- EDIT PROFILE ---------------------------

          //------------------------- EDIT Preferences -------------------------

          Flexible(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.editPreferenceScn);
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(JColor.white)),
              child: Text(
                JTexts.editPreferences,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
