import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_second/feature/auth/auth.dart';
import 'package:habits_second/product/constants/string_constants.dart';
import 'package:habits_second/product/initialize/application_start.dart';

void main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
