// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerProductsStore on ControllerProductsStoreBase, Store {
  final _$_itemsAtom = Atom(name: 'ControllerProductsStoreBase._items');

  @override
  ObservableList<Product> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(ObservableList<Product> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  final _$ControllerProductsStoreBaseActionController =
      ActionController(name: 'ControllerProductsStoreBase');

  @override
  void addProduct(Product product) {
    final _$actionInfo = _$ControllerProductsStoreBaseActionController
        .startAction(name: 'ControllerProductsStoreBase.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$ControllerProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
