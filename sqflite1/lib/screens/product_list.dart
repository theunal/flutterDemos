import 'package:flutter/material.dart';
import 'package:sqflite1/DataAccess/DbHelper.dart';
import 'package:sqflite1/models/Product.dart';

class ProductList2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductList2State();
  }
}

class _ProductList2State extends State {
  var dbHelper = DbHelper();
  List<Product>? products;
  int productCount = 0;

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
