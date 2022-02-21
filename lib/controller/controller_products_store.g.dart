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

  final _$toggleFavoriteAsyncAction =
      AsyncAction('ControllerProductsStoreBase.toggleFavorite');

  @override
  Future<void> toggleFavorite(Product product) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(product));
  }

  final _$loadProductsAsyncAction =
      AsyncAction('ControllerProductsStoreBase.loadProducts');

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  final _$addProductAsyncAction =
      AsyncAction('ControllerProductsStoreBase.addProduct');

  @override
  Future<void> addProduct(Product product) {
    return _$addProductAsyncAction.run(() => super.addProduct(product));
  }

  final _$deleteProductAsyncAction =
      AsyncAction('ControllerProductsStoreBase.deleteProduct');

  @override
  Future<void> deleteProduct(String id) {
    return _$deleteProductAsyncAction.run(() => super.deleteProduct(id));
  }

  final _$updateProductAsyncAction =
      AsyncAction('ControllerProductsStoreBase.updateProduct');

  @override
  Future<void> updateProduct(Product product) {
    return _$updateProductAsyncAction.run(() => super.updateProduct(product));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
