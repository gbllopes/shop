import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/constants.dart';
part 'controller_products_store.g.dart';

class ControllerProductsStore = ControllerProductsStoreBase
    with _$ControllerProductsStore;

abstract class ControllerProductsStoreBase with Store {
  @observable
  ObservableList<Product> _items = ObservableList.of([]);

  List<Product> get items => [..._items];

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  @action
  Future<void> toggleFavorite(Product product) async {
    Uri _baseUrl =
        Uri.parse('${Constants.BASE_API_URL}/products/${product.id}.json');
    product.isFavorite = !product.isFavorite;
    final index = _items.indexWhere((prod) => prod.id == product.id);
    if (index >= 0) {
      _items[index].isFavorite = product.isFavorite;
      await http.patch(_baseUrl,
          body: jsonEncode({'isFavorite': product.isFavorite}));
    }
  }

  @action
  Future<void> loadProducts() async {
    Uri _baseUrl = Uri.parse('${Constants.BASE_API_URL}/products.json');

    final response = await http.get(_baseUrl);
    Map<String, dynamic> data = jsonDecode(response.body);
    _items.clear();
    // if (!data.isEmpty) {
    //   data.forEach((productId, productData) {
    //     _items.add(Product(
    //         id: productId,
    //         title: productData['title'],
    //         price: productData['price'],
    //         description: productData['description'],
    //         imageUrl: productData['imageUrl'],
    //         isFavorite: productData['isFavorite']));
    //   });
    // }
  }

  @action
  Future<void> addProduct(Product product) async {
    Uri _baseUrl = Uri.parse('${Constants.BASE_API_URL}/products.json');
    final response = await http.post(
      _baseUrl,
      body: json.encode({
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'isFavorite': product.isFavorite
      }),
    );

    _items.add(Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        price: product.price,
        description: product.description,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite));
  }

  @action
  Future<void> deleteProduct(String id) async {
    Uri url = Uri.parse('${Constants.BASE_API_URL}/products/${id}.json');

    final index = _items.indexWhere((prod) => prod.id == id);
    Product product = _items[index];
    _items.remove(product);
    if (index >= 0) {
      final response = await http.delete(url);
      if (response.statusCode >= 400) {
        _items.insert(index, product);
      }
    }
  }

  @action
  Future<void> updateProduct(Product product) async {
    Uri _baseUrl =
        Uri.parse('${Constants.BASE_API_URL}/products/${product.id}.json');
    final index = _items.indexWhere((prod) => prod.id == product.id);
    if (index >= 0) {
      await http.patch(_baseUrl,
          body: jsonEncode({
            'title': product.title,
            'price': product.price,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'isFavorite': product.isFavorite
          }));
      _items[index] = product;
    }
  }
}
