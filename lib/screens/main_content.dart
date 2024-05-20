import 'package:ecommerceappfluttter/utils/product_class.dart';
import 'package:ecommerceappfluttter/widgets/category.dart';
import 'package:ecommerceappfluttter/widgets/home_app_second.dart';
import 'package:ecommerceappfluttter/widgets/image_slider.dart';
import 'package:ecommerceappfluttter/widgets/product_cart.dart';
import 'package:ecommerceappfluttter/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class MainContentScreen extends StatefulWidget {
  const MainContentScreen({Key? key}) : super(key: key);

  @override
  _MainContentScreenState createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              HomeAppSecondBar(
                onPressedIcone: () {},
                onPressedNotification: () {},
              ),
              SizedBox(height: 5),
              MySearchBar(),
              SizedBox(height: 10),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Category(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.88,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ProductCard(
                product: products[index],
              );
            },
            childCount: products.length,
          ),
        ),
      ],
    );
  }
}
