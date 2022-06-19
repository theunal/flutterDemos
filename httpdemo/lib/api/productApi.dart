import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    Uri uri = Uri.parse('http://10.0.2.2:3000/products');
    return http.get(uri);
  }

  static Future getProductByCategoryId(int? categoryId) {
    Uri uri = Uri.parse('http://10.0.2.2:3000/products?categoryId=$categoryId');
    return http.get(uri);
  }
}
