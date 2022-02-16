import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_order_store.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerOrderStore orderController =
        Provider.of<ControllerOrderStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
        backgroundColor: Colors.purple,
      ),
      body: Observer(
        builder: (_) => ListView.builder(
            itemCount: orderController.orders.length,
            itemBuilder: (context, index) =>
                OrderWidget(order: orderController.orders[index])),
      ),
      drawer: AppDrawer(),
    );
  }
}