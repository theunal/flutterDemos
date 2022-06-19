import 'package:bloc_demo/models/cart.dart';

class CartService {
  static List<Cart> cartItems = <Cart>[];

  // singleton
  static CartService singleton = CartService._internal();
  CartService._internal();
  factory CartService() {
    return singleton;
  }
  // singleton

  static void addToCart(Cart cart) {
    cartItems.add(cart);
  }

  static void removeFromCart(int cart) {
    cartItems.remove(cart);
  }

  static List<Cart> getCart() {
    return cartItems;
  }
}
