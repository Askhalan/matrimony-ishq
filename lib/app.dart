import 'package:flutter/material.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ishq Matrimony',
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
       initialRoute: Routes.authSelectionScn,
      routes: Routes.getRoutes(),
    );
  }
}
