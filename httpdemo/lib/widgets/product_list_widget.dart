import 'package:flutter/cupertino.dart';
import 'package:httpdemo/models/product.dart';
import 'package:httpdemo/widgets/product_list_row.dart';

class ProductListWidget extends StatefulWidget {
  List<Product>? products = <Product>[];
  ProductListWidget(this.products);

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return builProductList(context);
  }

  Widget builProductList(BuildContext context) {

  

    return Expanded(
      child: Column(
        children: [
          SizedBox(height:10,),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.products!.length, (index) {
                return ProductListRowWidget(widget.products![index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
