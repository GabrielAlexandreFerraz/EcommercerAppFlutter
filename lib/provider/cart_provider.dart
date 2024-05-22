import 'package:ecommerceappfluttter/utils/product_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addToCart(Product product, int quantity) {
    bool found = false;
    for (var element in _cart) {
      if (element.id == product.id) {
        element.quantity += quantity;
        found = true;
        break;
      }
    }
    if (!found) {
      product.quantity = quantity;
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQtn(int index) => _cart[index].quantity++;

  void decrementQtn(int index) {
    if (_cart[index].quantity > 0) {
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  totalPrice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      // Certifique-se de que 'price' e 'quantity' sejam convertidos para 'double'
      double price = double.tryParse(element.price.toString()) ?? 0.0;
      double quantity = double.tryParse(element.quantity.toString()) ?? 0.0;
      total1 += price * quantity;
    }
    return total1;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
