import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  Widget _buildIconButton(BuildContext context, IconData icon, int index) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: currentIndex == index
                ? Colors.grey.shade700
                : Colors.transparent,
          ),
          color:
              currentIndex == index ? Colors.grey.shade200 : Colors.transparent,
        ),
        padding: EdgeInsets.all(10),
        child: Icon(
          icon,
          size: 30,
          color: currentIndex == index
              ? Colors.grey.shade700
              : Colors.grey.shade400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 1,
      height: 70,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(context, Icons.favorite_border, 0),
          _buildIconButton(context, Icons.home, 1),
          _buildIconButton(context, Icons.shopping_cart_outlined, 2),
          _buildIconButton(context, Icons.person, 3),
        ],
      ),
    );
  }
}
