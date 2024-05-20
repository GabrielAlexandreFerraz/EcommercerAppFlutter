import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DetailDescription extends StatelessWidget {
  final String descriptionProducts;
  const DetailDescription({super.key, required this.descriptionProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.grayLightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              "Specifications",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              "Reviews",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          descriptionProducts,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
