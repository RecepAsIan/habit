import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_second/product/models/dates_model.dart';
import 'package:intl/intl.dart';

class HomeNotifier extends StateNotifier<DatesModel> {
  HomeNotifier() : super(DatesModel());

  final DateTime nowDate = DateTime.now();

  final formattedDateNowTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final String userUid = FirebaseAuth.instance.currentUser!.uid;

  List<DatesModel> thirtyDays = [];

  List<DatesModel> getPastThirtyDay() {
    for (int i = 0; i < 30; i++) {
      DateTime currentDate = nowDate.subtract(Duration(days: i));
      String formattedDateDays = DateFormat('dd').format(currentDate);
      String formattedDateMonth = DateFormat('MM').format(currentDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);
      thirtyDays.add(DatesModel(
          days: formattedDateDays,
          month: formattedDateMonth,
          years: formattedDate));
    }
    return thirtyDays;
  }

  String monthName(String month) {
    switch (month) {
      case '01':
        return 'Jan';
      case '02':
        return 'Feb';
      case '03':
        return 'Mar';
      case '04':
        return 'Apr';
      case '05':
        return 'May';
      case '06':
        return 'Jun';
      case '07':
        return 'Jul';
      case '08':
        return 'Aug';
      case '09':
        return 'Sep';
      case '10':
        return 'Oct';
      case '11':
        return 'Nov';
      case '12':
        return 'Dec';
    }
    return month;
  }
}
