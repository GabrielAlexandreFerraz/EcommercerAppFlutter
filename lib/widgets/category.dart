import 'package:ecommerceappfluttter/utils/category_class.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Function(int) onCategorySelected;
  final int selectedIndex;

  const Category({
    Key? key,
    required this.onCategorySelected,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              onCategorySelected(index);
            },
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.cover,
                    ),
                    border: isSelected
                        ? Border.all(
                            color: Colors.blue,
                            width: 3,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  categories[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 22),
      ),
    );
  }
}
