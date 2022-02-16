import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_products_store.dart';

import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerProductsStore productController =
        Provider.of<ControllerProductsStore>(context);

    Future<void> _showMyDialog() async {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tem certeza?'),
            content: Container(
              height: 20,
              child: Column(
                children: [
                  Text('Quer realmente excluir este produto?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Sim'),
                onPressed: () {
                  productController.deleteProduct(product);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Card(
      child: ListTile(
        title: Text(product.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    _showMyDialog();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
