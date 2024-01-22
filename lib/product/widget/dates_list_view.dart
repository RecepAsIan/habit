import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habits_second/feature/date/dates_view.dart';
import 'package:habits_second/feature/habit/habit_view.dart';
import 'package:habits_second/feature/home/home_provider.dart';
import 'package:habits_second/product/constants/color_constants.dart';
import 'package:habits_second/product/enums/widget_size.dart';
import 'package:habits_second/product/models/dates_model.dart';
import 'package:habits_second/product/utility/margin.dart';
import 'package:habits_second/product/utility/padding.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, DatesModel>((ref) {
  return HomeNotifier();
});

class DatesListView extends ConsumerWidget {
  const DatesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: WidgetSize.datesListViewSizedBox.value.toDouble(),
      decoration: BoxDecoration(color: ColorConstants.mineShaft),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: ColorConstants.mineShaft),
              height: WidgetSize.datesListViewSizedBox.value.toDouble(),
              child: ListView.builder(
                
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount:
                    ref.read(_homeProvider.notifier).getPastThirtyDay().length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DatesView(
                            docId:
                                '${ref.read(_homeProvider.notifier).getPastThirtyDay()[index].years}'),
                      ));
                    },
                    child: Container(
                      margin: AppMargin.lowMarginLeft,
                      width: WidgetSize.datesListListViewContainerWidth.value
                          .toDouble(),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${ref.read(_homeProvider.notifier).monthName('${ref.read(_homeProvider.notifier).getPastThirtyDay()[index].month}')}',
                              style: const TextStyle(
                                color: ColorConstants.boulder,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${ref.read(_homeProvider.notifier).getPastThirtyDay()[index].days}',
                              style: const TextStyle(
                                color: ColorConstants.boulder,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              VerticalDivider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: ColorConstants.boulder,
              ),
              Padding(
                padding: AppPadding.lowAll,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HabitView(),
                    ));
                  },
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(side: BorderSide.none),
                  child: const Icon(
                    Icons.add_outlined,
                    size: 30,
                    color: ColorConstants.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
