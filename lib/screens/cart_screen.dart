import 'package:ecommerceappfluttter/provider/cart_provider.dart';
import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:ecommerceappfluttter/widgets/check_out.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final PageController pageController;

  const CartScreen({Key? key, required this.pageController}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decrementQtn(index);
          });
        },
        child: Icon(icon, size: 20),
      );
    }

    return Scaffold(
      bottomSheet: CheckOutBox(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.pageController
                              .jumpToPage(1); // Voltar para MainContentScreen
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        "My Cart",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Container(), // Placeholder para manter o layout alinhado
                    ],
                  ),
                ),
                finalList.isEmpty
                    ? Center(child: Text("Your cart is empty"))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: finalList.length,
                        itemBuilder: (context, index) {
                          final cartItems = finalList[index];
                          return Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(cartItems.image),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartItems.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            cartItems.category,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "\$${cartItems.price}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 35,
                                right: 35,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          finalList.removeAt(index);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppColors.grayLightColor,
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10),
                                          productQuantity(Icons.add, index),
                                          SizedBox(width: 10),
                                          Text(
                                            cartItems.quantity.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          productQuantity(Icons.remove, index),
                                          SizedBox(width: 10),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
