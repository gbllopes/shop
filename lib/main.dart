import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_order_store.dart';
import 'package:shop/controller/controller_products_store.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/auth_screen.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/orders_screen.dart';
import 'package:shop/views/product_detail_screen.dart';
import 'package:shop/views/product_form_screen.dart';
import 'package:shop/views/products_overview_screen.dart';
import 'package:shop/views/products_screen.dart';

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
        ),
        Provider<ControllerOrderStore>(
          create: (_) => ControllerOrderStore(),
        )
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            primaryColor: Colors.purple,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.deepOrange, // Your accent color
            ),
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        initialRoute: AppRoutes.AUTH,
        routes: {
          AppRoutes.AUTH: (context) => AuthScreen(),
          AppRoutes.HOME: (context) => ProductsOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailScreen(),
          AppRoutes.CART_DETAIL: (context) => CartScreen(),
          AppRoutes.LIST_ORDERS: (context) => OrdersScreen(),
          AppRoutes.PRODUCTS: (context) => ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormScreen(),
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
