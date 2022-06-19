import 'dart:async';

import 'package:bloc_demo/data/product_service.dart';
import 'package:bloc_demo/models/product.dart';

class ProductBloc {
  final cartStreamController = StreamController.broadcast();
  Stream get getStream => cartStreamController.stream;

  List<Product> getAll() {
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();