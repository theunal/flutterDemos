import 'dart:async';
import 'package:bloc_demo/data/cart_service.dart';
import 'package:bloc_demo/models/cart.dart';

class CartBloc {
  final cartStreamController = StreamController.broadcast();
  Stream get getStream => cartStreamController.stream;

  void addToCart(Cart item) {
    CartService.addToCart(item);
    cartStreamController.sink.add(getAll());
  }

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    cartStreamController.sink.add(getAll());
  }

  List<Cart> getAll() {
    return CartService.getAll();
  }
}

final cartBloc = CartBloc();
