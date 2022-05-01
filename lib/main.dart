import 'package:flutter/material.dart';
import 'package:lab8/routes/app_routes.dart';
import 'styles/app_themes.dart';
import 'routes/appPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lab 8',
      theme: AppThemes.lightTheme,
      initialRoute: AppRoutes.initial,
      routes: AppPages.pageto,
    );
  }
}
