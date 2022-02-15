import 'package:flutter/material.dart';
import 'package:shop/controller/controller_products_store.dart';

import 'package:shop/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScrenState();
}

class _ProductDetailScrenState extends State<ProductDetailScreen> {
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
