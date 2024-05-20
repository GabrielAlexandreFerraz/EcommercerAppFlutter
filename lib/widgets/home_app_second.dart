import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppSecondBar extends StatelessWidget {
  final Function() onPressedIcone;
  final Function() onPressedNotification;

  const HomeAppSecondBar(
      {Key? key,
      required this.onPressedIcone,
      required this.onPressedNotification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: onPressedIcone,
              icon: Image.asset(
                "assets/icones/icone.png",
                height: 20,
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: onPressedNotification,
              icon: Icon(Icons.notification_add_outlined),
            ),
          ],
        )
      ],
    );
  }
}
