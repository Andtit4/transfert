import 'package:flutter/material.dart';
import 'package:transfert/core/theme/app_theme.dart';
import 'package:transfert/presentation/pages/pages/login_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginPage(),
    );
  }
}
