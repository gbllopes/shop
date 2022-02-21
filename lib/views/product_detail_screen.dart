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
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 10),
              Text(
                'R\$${product.price}',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  product.description,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
