import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_second/feature/habit/habit_provider.dart';
import 'package:habits_second/product/constants/color_constants.dart';
import 'package:habits_second/product/models/habit_list.dart';
import 'package:habits_second/product/widget/habit_add_container.dart';

final _habitProvider =
    StateNotifierProvider<HabitViewNotifier, HabitView>((ref) {
  return HabitViewNotifier();
});

class HabitView extends ConsumerWidget {
  const HabitView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConstants.mineApprox,
      appBar: AppBar(
        title: Text('denden'),
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: habitList.length,
          itemBuilder: (BuildContext context, int index) {
            final habit = habitList[index];
            return HabitAddContainer(
              containerColor: Color(habit.containerColor!.toInt()),
              habitText: '${habit.habitText}',
              imageText: '${habit.imageText}',
              onTap: () {
                ref.read(_habitProvider.notifier).habitAdd(
                      subtitleText: '${habit.subtitleText}',
                      titleText: '${habit.titleText}',
                      trailingText: '${habit.trailingText}',
                    );
              },
            );
          },
        ),
      ),
    );
  }
}
