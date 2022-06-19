import 'package:bloc_demo/models/product.dart';

class ProductService {
  static List<Product> products = <Product>[];

  // singleton
  static ProductService singleton = ProductService._internal();
  ProductService._internal();
  factory ProductService() {
    return singleton;
  }
  // singleton

  static List<Product> getAll() {
    products.add(new Product(1, 'laptop 1', 9500));
    products.add(new Product(2, 'laptop 2', 12548));
    products.add(new Product(3, 'laptop 3', 18999));
    return products;
  }
}
