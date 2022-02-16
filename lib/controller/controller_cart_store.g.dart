// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerCartStore on ControllerCartStoreBase, Store {
  final _$_itemsAtom = Atom(name: 'ControllerCartStoreBase._items');

  @override
  ObservableMap<String, CartItem> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(ObservableMap<String, CartItem> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  final _$ControllerCartStoreBaseActionController =
      ActionController(name: 'ControllerCartStoreBase');

  @override
  void addItemToCart(Product product) {
    final _$actionInfo = _$ControllerCartStoreBaseActionController.startAction(
        name: 'ControllerCartStoreBase.addItemToCart');
    try {
      return super.addItemToCart(product);
    } finally {
      _$ControllerCartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItemFromCart(String productId) {
    final _$actionInfo = _$ControllerCartStoreBaseActionController.startAction(
        name: 'ControllerCartStoreBase.removeItemFromCart');
    try {
      return super.removeItemFromCart(productId);
    } finally {
      _$ControllerCartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeUnityItemFromCart(String productId) {
    final _$actionInfo = _$ControllerCartStoreBaseActionController.startAction(
        name: 'ControllerCartStoreBase.removeUnityItemFromCart');
    try {
      return super.removeUnityItemFromCart(productId);
    } finally {
      _$ControllerCartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
