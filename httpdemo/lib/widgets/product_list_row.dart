import 'package:flutter/material.dart';
import 'package:httpdemo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product? product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {



    return InkWell(
      child: Card(
        child: Column(
          children: [
            Container(
              // ignore: sort_child_properties_last
              child: Image.network(
                  'https://picsum.photos/1000/700/?image=${product!.id}'),
              height: 130,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Text(product!.productName.toString()),
            SizedBox(height: 3,),
            Text(
              product!.unitPrice.toString() + ' ₺', 
              style: TextStyle(fontSize: 18, color: Colors.green[400]),
            ),
          ],
        ),
      ),
    );
  }
}
