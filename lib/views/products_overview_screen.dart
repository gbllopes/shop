import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_cart_store.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

enum FavoriteOptions { Favorite, All }

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<ControllerCartStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha loja'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (FavoriteOptions selectedValue) {
              setState(() {
                if (selectedValue == FavoriteOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FavoriteOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FavoriteOptions.All,
              ),
            ],
          ),
          Observer(
            builder: (_) => Badge(
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
              value: cartController.items.length,
            ),
          ),
        ],
      ),
      body: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
    );
  }
}
