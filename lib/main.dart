import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/screens/home_screen.dart';
import 'package:news_app/features/templete/presentation/screens/navigation_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const NavigationScreen(),
    );
  }
}
