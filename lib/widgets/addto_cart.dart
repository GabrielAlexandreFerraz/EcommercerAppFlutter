import 'package:ecommerceappfluttter/provider/cart_provider.dart';
import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:ecommerceappfluttter/utils/product_class.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final Product product;
  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndexAddToCart = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black),
        padding: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (currentIndexAddToCart > 1) {
                        setState(() {
                          currentIndexAddToCart--;
                        });
                      }
                    },
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Text(
                    currentIndexAddToCart.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndexAddToCart++;
                      });
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.addToCart(widget.product, currentIndexAddToCart);
                const snackBar = SnackBar(
                  content: Text(
                    "Successfully Added!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 2),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: AppColors.grayMediumColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
