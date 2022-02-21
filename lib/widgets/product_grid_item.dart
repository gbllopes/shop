import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/controller/controller_cart_store.dart';
import 'package:shop/controller/controller_products_store.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatefulWidget {
  final Product product;

  ProductGridItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  @override
  Widget build(BuildContext context) {
    bool _isFavorite = widget.product.isFavorite;
    // final Product product = Provider.of<Product>(context);
    final cartController = Provider.of<ControllerCartStore>(context);
    final productController = Provider.of<ControllerProductsStore>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: widget.product);
          },
          child: Image.network(
            widget.product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              productController.toggleFavorite(widget.product);
            },
          ),
          title: Text(
            widget.product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Produto [${widget.product.title}] adicionado com sucesso!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'DESFAZER',
                    onPressed: () {
                      if (cartController.items[widget.product.id]!.quantity >
                          1) {
                        cartController
                            .removeUnityItemFromCart(widget.product.id!);
                      } else {
                        cartController.removeItemFromCart(widget.product.id!);
                      }
                    },
                  ),
                ),
              );
              cartController.addItemToCart(widget.product);
            },
          ),
        ),
      ),
    );
  }
}
