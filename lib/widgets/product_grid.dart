import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/controller/controller_products_store.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/product_grid_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGrid({
    Key? key,
    required this.showFavoriteOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ControllerProductsStore>(context);
    final List<Product> loadedProducts = showFavoriteOnly
        ? productController.favoriteItems
        : productController.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductGridItem(),
      ),
    );
  }
}
