import 'package:flutter/material.dart';
import 'package:habits_second/product/constants/color_constants.dart';

class HabitContainer extends StatelessWidget {
  const HabitContainer(
      {super.key,
      required this.trailingText,
      required this.leadingIcon,
      required this.titleText,
      required this.subtitleText});
  final String trailingText;
  final String titleText;
  final String subtitleText;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            leadingIcon,
            size: 45,
          ),
          title: Text(titleText,
              style: const TextStyle(color: ColorConstants.white)),
          subtitle: Text(subtitleText,
              style: const TextStyle(color: ColorConstants.white)),
          trailing: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 20,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(
                color: ColorConstants.white,
                width: 1.5,
              ),
            ),
            child: Text(trailingText,
                style: const TextStyle(color: ColorConstants.white)),
          ),
        ),
        const Divider(
          color: ColorConstants.mineShaft2,
          thickness: 3,
        )
      ],
    );
  }
}
