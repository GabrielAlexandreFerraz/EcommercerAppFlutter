import 'package:ecommerceappfluttter/provider/cart_provider.dart';
import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CheckOutBox extends StatelessWidget {
  const CheckOutBox({super.key});

  @override
  Widget build(BuildContext context) {
    final providerCheckOut = CartProvider.of(context);
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                filled: true,
                fillColor: AppColors.grayLightColor,
                hintText: "Enter Discount Code",
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      color: AppColors.brownColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grayMediumColor,
                ),
              ),
              Text(
                "\$${providerCheckOut.totalPrice()}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${providerCheckOut.totalPrice()}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.grayLightColor,
              minimumSize: Size(double.infinity, 55),
            ),
            child: Text(
              "Check out",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
