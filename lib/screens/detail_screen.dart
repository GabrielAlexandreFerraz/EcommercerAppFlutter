import 'package:ecommerceappfluttter/utils/app_colors.dart';
import 'package:ecommerceappfluttter/utils/product_class.dart';
import 'package:ecommerceappfluttter/widgets/addto_cart.dart';
import 'package:ecommerceappfluttter/widgets/detail_app_bar.dart';
import 'package:ecommerceappfluttter/widgets/detail_description.dart';
import 'package:ecommerceappfluttter/widgets/detail_image_slider.dart';
import 'package:ecommerceappfluttter/widgets/itens_details.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImageDetail = 0;
  int currentColorDetail = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailAppBar(product: widget.product),
              DetailImageSlider(
                  onChange: (index) {
                    setState(() {
                      currentImageDetail = index;
                    });
                  },
                  image: widget.product.image),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      width: currentImageDetail == index ? 15 : 8,
                      height: 8,
                      margin: EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentImageDetail == index
                              ? Colors.black
                              : Colors.transparent,
                          border: Border.all(color: Colors.black))),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemsDetails(product: widget.product),
                    const SizedBox(height: 20),
                    const Text(
                      "Color",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              currentColorDetail = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentColorDetail == index
                                  ? Colors.white
                                  : widget.product.colors[index],
                              border: currentColorDetail == index
                                  ? Border.all(
                                      color: widget.product.colors[index],
                                    )
                                  : null,
                            ),
                            padding: currentColorDetail == index
                                ? EdgeInsets.all(2)
                                : null,
                            margin: EdgeInsets.only(right: 10),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: widget.product.colors[index],
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    DetailDescription(
                        descriptionProducts: widget.product.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
