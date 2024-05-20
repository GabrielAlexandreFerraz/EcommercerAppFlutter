import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:ecommerceappfluttter/utils/product_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.grayLightColor,
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(width: 3),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      product.review,
                      style: TextStyle(
                        color: AppColors.grayMediumColor,
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Seller:",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: product.seller,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
