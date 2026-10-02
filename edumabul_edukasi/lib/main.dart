import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EDUMABUL',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: SplashScreen(),
    );
  }
}
