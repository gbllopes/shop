// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerOrderStore on ControllerOrderStoreBase, Store {
  final _$_ordersAtom = Atom(name: 'ControllerOrderStoreBase._orders');

  @override
  ObservableList<Order> get _orders {
    _$_ordersAtom.reportRead();
    return super._orders;
  }

  @override
  set _orders(ObservableList<Order> value) {
    _$_ordersAtom.reportWrite(value, super._orders, () {
      super._orders = value;
    });
  }

  final _$getOrdersAsyncAction =
      AsyncAction('ControllerOrderStoreBase.getOrders');

  @override
  Future<void> getOrders() {
    return _$getOrdersAsyncAction.run(() => super.getOrders());
  }

  final _$addOrderAsyncAction =
      AsyncAction('ControllerOrderStoreBase.addOrder');

  @override
  Future<void> addOrder(Map<String, CartItem> products, double total) {
    return _$addOrderAsyncAction.run(() => super.addOrder(products, total));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
