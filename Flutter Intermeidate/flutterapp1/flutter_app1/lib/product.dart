import 'package:flutter/material.dart';





class Product extends StatelessWidget {
  final List<String> product;

  Product(this.product){
    print('[Product Widget] COnstructor');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: product.map((element) => Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.png'),
          Text(element)
        ],
      ),
    )
    ).toList(),
    );
  }
}
