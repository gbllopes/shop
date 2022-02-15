import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_products_store.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/product_detail_screen.dart';
import 'package:shop/views/products_overview_screen.dart';

import 'controller/controller_cart_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ControllerProductsStore>(
            create: (_) => ControllerProductsStore()),
        Provider<ControllerCartStore>(
          create: (_) => ControllerCartStore(),
        )
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.deepOrange, // Your accent color
            ),
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        initialRoute: AppRoutes.LIST_PRODUCTS,
        routes: {
          AppRoutes.LIST_PRODUCTS: (context) => ProductsOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailScreen(),
          AppRoutes.CART_DETAIL: (context) => CartScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: Center(
        child: Text('Vamos desenvolver uma loja?'),
      ),
    );
  }
}
