import 'package:flutter/material.dart';
import 'package:shop/controller/controller_products_store.dart';

import 'package:shop/models/product.dart';

class ProductDetailScren extends StatefulWidget {
  ProductDetailScren({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailScren> createState() => _ProductDetailScrenState();
}

class _ProductDetailScrenState extends State<ProductDetailScren> {
  final controller = ControllerProductsStore();

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(
        child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
      ),
    );
  }
}
