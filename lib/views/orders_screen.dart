import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_order_store.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

Future<void> _refreshOrders(BuildContext context) async {
  await Provider.of<ControllerOrderStore>(context, listen: false).getOrders();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final ControllerOrderStore orderController =
        Provider.of<ControllerOrderStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
        backgroundColor: Colors.purple,
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshOrders(context),
        child: Observer(
          builder: (_) => FutureBuilder(
            future: Provider.of<ControllerOrderStore>(context, listen: false)
                .getOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: orderController.orders.length,
                    itemBuilder: (context, index) =>
                        OrderWidget(order: orderController.orders[index]));
              }
            },
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
