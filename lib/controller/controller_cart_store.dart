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

  int get itensCartCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, product) {
      total += product.price * product.quantity;
    });
    return total;
  }

  @action
  void addItemToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id!,
          (existingItem) => CartItem(
                id: existingItem.id,
                productId: existingItem.productId,
                title: existingItem.title,
                quantity: existingItem.quantity + 1,
                price: existingItem.price,
                urlImage: existingItem.urlImage,
              ));
    } else {
      _items.putIfAbsent(
          product.id!,
          () => CartItem(
                id: Random().nextDouble().toString(),
                productId: product.id!,
                title: product.title,
                quantity: 1,
                price: product.price,
                urlImage: product.imageUrl,
              ));
    }
  }

  @action
  void removeItemFromCart(String productId) {
    _items.remove(productId);
  }

  @action
  void removeUnityItemFromCart(String productId) {
    _items.update(
        productId,
        (existingCartItem) => CartItem(
              id: existingCartItem.id,
              productId: existingCartItem.productId,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity > 1
                  ? existingCartItem.quantity -= 1
                  : existingCartItem.quantity,
              price: existingCartItem.price,
              urlImage: existingCartItem.urlImage,
            ));
  }

  @action
  void clearCart() {
    _items = ObservableMap.of({});
  }
}
