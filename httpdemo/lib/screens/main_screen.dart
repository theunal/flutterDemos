import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:httpdemo/api/categoryApi.dart';
import 'package:httpdemo/api/productApi.dart';
import 'package:httpdemo/models/category.dart';
import 'package:httpdemo/models/product.dart';
import 'package:httpdemo/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category>? categories;
  List<Widget> categoryWidgets = [];

  List<Product>? products = <Product>[];

  @override
  void initState() {
    getCategoriesFromApi();
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'alışveriş sistemi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoryWidgets,
                ),
              ),
              ProductListWidget(products),
            ],
          )),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((res) {
      setState(() {
        Iterable list = json.decode(res.body);
        categories = list.map((model) => Category.fromJson(model)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories!.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories![i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
        child: Text(category.categoryName!,
            style: TextStyle(color: Colors.blueGrey)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.lightGreenAccent),
        ),
        onPressed: () {
          getProductsByCategoryId(category.id);
        });
  }

  void getProductsByCategoryId(int? id) {
    ProductApi.getProductByCategoryId(id).then((res) {
      setState(() {
        Iterable list = json.decode(res.body);
        products = list.map((model) => Product.fromJson(model)).toList();
      });
    });
  }

  void getProducts() {
    ProductApi.getProducts().then((res) {
      setState(() {
        Iterable list = json.decode(res.body);
        products = list.map((model) => Product.fromJson(model)).toList();
      });
    });
  }
}
