import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/widgets/appbar/appbar.dart';
import 'package:ishq/core/common/widgets/spaces/gap_2.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/authentication/bloc/auth_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/pages/settings/s_profile_suite_details.dart';
import 'package:ishq/features/auth/presentation/profile/pages/settings/w_settings_button.dart';
import 'package:ishq/utils/constants/colors.dart';
import 'package:ishq/utils/constants/sizes.dart';
import 'package:ishq/utils/constants/text_strings.dart';

class ScnSettings extends StatelessWidget {
  const ScnSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogedOut) {
            Navigator.pushReplacementNamed(context, Routes.authSelectionScn);
          }
        },
        child: JAppbar(
          centerTitle: true,
          title: Text(
            JTexts.settings,
            style: TextStyle(color: JColor.white, fontSize: 24),
          ),
          showBackArrow: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: JSize.defaultPadding,
              child: Column(
                children: [
                  //----------------------------- PROFILE SUITE -----------------------------

                  ProfileSuiteDetails(),
                  JGap2(),

                  //---------------------------- FAQ & HELP CENTER --------------------------

                  Row(
                    children: [
                      SettingsButtons(
                        text: 'FAQ',
                        isFlexible: false,
                      ),
                      JGap2(),
                      SettingsButtons(
                        text: 'Help Center',
                      )
                    ],
                  ),
                  JGap2(),
                  //--------------------------- SHARE SUCCESS STORY -------------------------

                  Row(
                    children: [
                      SettingsButtons(
                        text: "Share your success story",
                        height: 110,
                      ),
                    ],
                  ),
                  JGap2(),

                  //---------------------------- SECURITY MANAGEMENT ------------------------

                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLogedOut) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.authSelectionScn,
                          (route) => false,
                        );
                      }
                    },
                    child: Row(
                      children: [
                        // SettingsButtons(text: "Change password"),
                        // JGap2(),
                        SettingsButtons(
                            text: JTexts.logout,
                            onTap: () {
                              context.read<AuthBloc>().add(AuthLogout());
                            }),
                        JGap2(),
                        SettingsButtons(
                          text: "Version",
                          isLabel: true,
                          isFlexible: false,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
