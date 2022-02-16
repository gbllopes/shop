import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order.dart';
part 'controller_order_store.g.dart';

class ControllerOrderStore = ControllerOrderStoreBase
    with _$ControllerOrderStore;

abstract class ControllerOrderStoreBase with Store {
  @observable
  ObservableList<Order> _orders = ObservableList.of([]);

  List<Order> get orders {
    return [..._orders];
  }

  @action
  void addOrder(List<CartItem> products, double total) {
    _orders.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: total,
        products: products,
        date: DateTime.now(),
      ),
    );
  }
}
