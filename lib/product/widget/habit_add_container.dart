import 'package:flutter/material.dart';
import 'package:habits_second/product/enums/image_size.dart';

class HabitAddContainer extends StatelessWidget {
  const HabitAddContainer({
    super.key,
    required this.containerColor,
    required this.habitText,
    required this.imageText,
    required this.onTap,
  });
  final Color containerColor;
  final String imageText;
  final String habitText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 10),
        width: 190,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 8),
              child: Text(habitText),
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                imageText,
                height: ImageSize.habitAddContainerImage.value.toDouble(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
