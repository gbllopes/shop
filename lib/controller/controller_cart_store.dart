import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';
part 'controller_cart_store.g.dart';

class ControllerCartStore = ControllerCartStoreBase with _$ControllerCartStore;

abstract class ControllerCartStoreBase with Store {
  @observable
  ObservableMap<String, CartItem> _items = ObservableMap.of({});

  Map<String, CartItem> get items {
    return {..._items};
  }

  @action
  void addItemToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => CartItem(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              price: existingItem.price));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
              id: Random().nextDouble().toString(),
              title: product.title,
              quantity: 1,
              price: product.price));
    }
  }
}
