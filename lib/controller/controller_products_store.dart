import 'package:mobx/mobx.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';
part 'controller_products_store.g.dart';

class ControllerProductsStore = ControllerProductsStoreBase
    with _$ControllerProductsStore;

abstract class ControllerProductsStoreBase with Store {
  @observable
  ObservableList<Product> _items = ObservableList.of(DUMMY_PRODUCTS);

  List<Product> get items => [..._items];

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  @action
  void addProduct(Product product) => _items.add(product);

  @action
  void deleteProduct(Product product) => _items.remove(product);

  @action
  void updateProduct(Product product) {
    final index = _items.indexWhere((prod) => prod.id == product.id);

    if (index > 0) {
      _items[index] = product;
    }
  }
}
