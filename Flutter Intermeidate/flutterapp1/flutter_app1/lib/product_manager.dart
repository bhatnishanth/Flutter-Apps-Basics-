import 'package:flutter/material.dart';

import './product.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  ProductManager({this.startingProduct = 'Sweets tester'}){
    print('[ProductManager Widget] Constructor ');
  }
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {


  List<String> _product=[];
  @override
  void initState() {
    _product.add(widget.startingProduct);
    super.initState();
  }
  @override
  void didUpdateWidget(ProductManager oldWidget) {
   print("didUpdate()");
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product){
    setState(() {
      _product.add(product);

    });

  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [Container(
      margin: EdgeInsets.all(10.0),
      child: ProductControl(_addProduct),
    ),
      Product(_product)
    ],
    );
  }
}
