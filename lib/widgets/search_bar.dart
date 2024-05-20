import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: Colors.blueGrey[25],
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.grayLightColor,
            size: 30,
          ),
          const SizedBox(width: 40),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...", border: InputBorder.none),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: AppColors.grayLightColor,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                color: AppColors.grayLightColor,
              ))
        ],
      ),
    );
  }
}
