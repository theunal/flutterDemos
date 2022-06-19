import 'package:bloc_demo/blocs/cart_bloc.dart';
import 'package:bloc_demo/blocs/product_bloc.dart';
import 'package:bloc_demo/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alışveriş'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
        initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, snapshot) {
          return snapshot.data.toString().length > 0
              ? buildProductListItems(snapshot)
              : Center(
                  child: Text('data yok'),
                );
        });
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text(list[index].price.toString()),
          trailing: IconButton(
            icon: Icon(Icons.add, color: Colors.green),
            onPressed: () {
              cartBloc.addToCart(Cart(list[index], 1));
            },
          ),
        );
      },
    );
  }
}
