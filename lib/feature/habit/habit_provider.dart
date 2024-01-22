import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_second/feature/habit/habit_view.dart';
import 'package:intl/intl.dart';

class HabitViewNotifier extends StateNotifier<HabitView> {
  HabitViewNotifier() : super(const HabitView());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String userUid = FirebaseAuth.instance.currentUser!.uid;

  final DateTime nowDate = DateTime.now();
  void habitAdd({required String titleText,required String subtitleText, required String trailingText}) {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(nowDate);
    try {
      _firestore
          .collection('users')
          .doc(userUid)
          .collection('dates')
          .doc(formattedDate)
          .collection('habit')
          .add({
        'titleText': titleText,
        'subtitleText': subtitleText,
        'trailingText': trailingText,
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (error) {
      print('catch error $error');
    }
  }
}
