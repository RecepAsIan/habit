import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits_second/feature/date/dates_mixin.dart';
import 'package:habits_second/product/constants/color_constants.dart';
import 'package:habits_second/product/widget/dates_list_view.dart';
import 'package:habits_second/product/widget/habit_container.dart';

class DatesView extends StatefulWidget {
  const DatesView({super.key, required this.docId});
  final String docId;

  @override
  State<DatesView> createState() => _DatesViewState();
}

class _DatesViewState extends State<DatesView> with DatesMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.codGray,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.docId,
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
                    .doc(userID)
                    .collection('dates')
                    .doc(widget.docId)
                    .collection('habit')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        'habit is empty pls habit add',
                        style: TextStyle(color: ColorConstants.white),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final dates = snapshot.data!.docs[index];
                        print(dates.id);
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
            DatesListView()
          ],
        ),
      ),
    );
  }
}
