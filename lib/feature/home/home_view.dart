import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_second/feature/home/home_provider.dart';
import 'package:habits_second/product/constants/color_constants.dart';
import 'package:habits_second/product/models/dates_model.dart';
import 'package:habits_second/product/widget/dates_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habits_second/product/widget/habit_container.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, DatesModel>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _home = ref.read(_homeProvider.notifier);
    final String firstDocId = _home.userUid;
    final String secondDocId = _home.formattedDateNowTime;
    return Scaffold(
      backgroundColor: ColorConstants.codGray,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Current Time',
                  style: const TextStyle(
                    color: ColorConstants.boulder,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(firstDocId)
                    .collection('dates')
                    .doc(secondDocId)
                    .collection('habit')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SizedBox.shrink(
                            child: CircularProgressIndicator()));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('habit is empty pls habit add'),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final dates = snapshot.data!.docs[index];
                        return HabitContainer(
                            trailingText: dates['trailingText'],
                            leadingIcon: Icons.check_box_outline_blank_outlined,
                            titleText: dates['titleText'],
                            subtitleText: dates['subtitleText']);
                      },
                    ),
                  );
                },
              ),
            ),
            const DatesListView(),
          ],
        ),
      ),
    );
  }
}
