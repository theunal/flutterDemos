import 'package:flutter/material.dart';
import 'DataAccess/DbHelper.dart';
import 'models/Product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dbHelper = DbHelper();
  List<Product>? products;
  int productCount = 1;

  @override
  void initState() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      this.products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product List'),
        ),
        body: buildProductList2());
  }

  buildProductList2() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.grey,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Text('p'),
              ),
              title: Text('title'),
              subtitle: Text('subtitle'),
              onTap: () {
                print('on tap');
              },
            ),
          );
        });
  }
}
