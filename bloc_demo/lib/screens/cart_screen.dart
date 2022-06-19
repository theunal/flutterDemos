import 'package:bloc_demo/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sepet'),
      ),
      body: StreamBuilder(
        initialData: cartBloc.getAll(),
        stream: cartBloc.getStream,
        builder: (context, snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].product.name),
          subtitle: Text(cart[index].product.price.toString()),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              cartBloc.removeFromCart(cart[index]);
            },
          ),
        );
      },
    );
  }
}
