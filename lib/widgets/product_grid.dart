import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:shop/controller/controller_products_store.dart';
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

    return Observer(
      builder: (_) => GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: showFavoriteOnly
            ? productController.favoriteItems.length
            : productController.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductGridItem(
            product: showFavoriteOnly
                ? productController.favoriteItems[i]
                : productController.items[i]),
      ),
    );
  }
}
