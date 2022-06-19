import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite1/DataAccess/DbHelper.dart';

import '../models/Product.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends State {
  var dbHelper = DbHelper();
  List<Product>? products;
  int productCount = 0;

  @override
  void initState() {
    dbHelper.getProducts().then((data) => {products = data});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: buildProductList(),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
      itemCount: productCount,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.cyan,
          elevation: 2,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('p'),
            ),
          //  title: Text(products![index].name!),
            title: Text("yusuf unal"),
            subtitle: Text(products![index].description!),
          ),
        );
      },
    );
  }
}
