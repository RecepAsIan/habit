import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

mixin DatesMixin<T extends StatefulWidget> on State<T> {
  final userID = FirebaseAuth.instance.currentUser!.uid;
}
