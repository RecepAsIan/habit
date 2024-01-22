import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin LoginMixin<T extends StatefulWidget> on State<T> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //SignIn
  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }
}
