import 'package:flutter/material.dart';
import 'package:habits_second/feature/auth/login_or_register/login/login_view.dart';
import 'package:habits_second/feature/auth/login_or_register/register/register_view.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginView(onPressed: togglePages);
    } else {
      return RegisterView(onPressed: togglePages);
    }
  }
}
