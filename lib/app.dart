import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ishq Matrimony',
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
       initialRoute: Routes.screenRedirect,
      routes: Routes.getRoutes(),
    );
  }
}
