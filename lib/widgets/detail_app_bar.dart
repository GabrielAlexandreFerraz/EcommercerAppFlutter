import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.grayLightColor,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.grayLightColor,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: Icon(Icons.share_outlined),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.grayLightColor,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
