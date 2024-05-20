class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "Shoes", image: "assets/shoes.png"),
  Category(title: "Beauty", image: "assets/beauty.png"),
  Category(title: "Women", image: "assets/slider2.png"),
  Category(title: "Jewelry", image: "assets/jewelry.png"),
  Category(title: "Men", image: "assets/men.png"),
];
