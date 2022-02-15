import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_cart_store.dart';
import 'package:shop/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerCartStore cartController =
        Provider.of<ControllerCartStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: Observer(
                      builder: (_) => Text(
                        'R\$${cartController.totalAmount.toStringAsFixed(2)}',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'COMPRAR',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                itemCount: cartController.itensCartCount,
                itemBuilder: (context, index) => CartItemWidget(
                    cartItemProductId:
                        cartController.items.values.toList()[index].productId),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
