import 'package:flutter/material.dart';
import 'package:ishq/core/theme/theme.dart';
import 'package:ishq/features/auth/presentation/pages/signup/scn_signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ishq Matrimony',
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
      home: ScnSignup(),
    );
  }
}
