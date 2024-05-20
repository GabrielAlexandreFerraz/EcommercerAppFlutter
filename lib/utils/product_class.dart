import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final String price;
  final List<Color> colors;
  final String category;
  final double rate;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.review,
    required this.description,
    required this.image,
    required this.price,
    required this.colors,
    required this.seller,
    required this.category,
    required this.rate,
    this.quantity = 0,
  });
}

final List<Product> products = [
  Product(
      id: 'id01',
      title: '"Wirelless Headphones',
      review: "(320 Reviews)",
      description:
          "Texto para descrever o produto ,Texto para descrever o produto,Texto para descrever o produto,Texto para descrever o produto,Texto para descrever o produto",
      image: "assets/all/wireless.png",
      price: "120",
      colors: [Colors.black, Colors.blue, Colors.orange],
      seller: " Texto 1234",
      category: "Eletronics",
      rate: 4.8,
      quantity: 1),
  Product(
      id: 'id02',
      title: "Woman Sweter",
      review: "(32 Reviews)",
      description:
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      image: "assets/all/sweet.png",
      price: "120",
      colors: [Colors.brown, Colors.deepPurple, Colors.pink],
      seller: '"Joy Store',
      category: "Woman Fashion",
      rate: 4.5,
      quantity: 1),
  Product(
      id: 'id03',
      title: "Smart Watch",
      review: "(20 Reviews)",
      description:
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      image: "assets/all/miband.jpg",
      price: "55",
      colors: [Colors.black, Colors.amber, Colors.purple],
      seller: 'Electronics',
      category: "Woman Fashion",
      rate: 4.5,
      quantity: 1),
  Product(
      id: 'id04',
      title: "Mens Jacket ",
      review: "(32 Reviews)",
      description:
          "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      image: "assets/all/jacket.png",
      price: "155",
      colors: [Colors.brown, Colors.deepPurple, Colors.pink],
      seller: '"Jacket Store',
      category: "Electronics",
      rate: 4.5,
      quantity: 1),
];
