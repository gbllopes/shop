import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/order.dart';
import 'package:shop/utils/constants.dart';
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
  Future<void> getOrders() async {
    Uri url = Uri.parse('${Constants.BASE_API_URL}/orders.json');

    final response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    this._clear();
    if (!data.isEmpty) {
      data.values
          .map((order) => _orders.add(Order(
                id: order['id'],
                total: order['total'],
                products: (order['products'] as List<dynamic>).map((product) {
                  return CartItem(
                    id: product['id'],
                    productId: product['productId'],
                    title: product['title'],
                    price: product['price'],
                    urlImage: product['urlImage'],
                  );
                }).toList(),
                date: DateTime.parse(order['date']),
              )))
          .toList();
    }
  }

  @action
  Future<void> addOrder(Map<String, CartItem> products, double total) async {
    Uri url = Uri.parse('${Constants.BASE_API_URL}/orders.json');
    try {
      final date = DateTime.now();
      final response = await http.post(url,
          body: json.encode({
            'total': total,
            'date': date.toIso8601String(),
            'products': products.values
                .map((cartItem) => {
                      'id': cartItem.id,
                      'productId': cartItem.productId,
                      'title': cartItem.title,
                      'quantity': cartItem.quantity,
                      'price': cartItem.price,
                      'urlImage': cartItem.urlImage
                    })
                .toList()
          }));

      _orders.insert(
        0,
        Order(
          id: jsonDecode(response.body)['name'],
          total: total,
          products: products.values.toList(),
          date: date,
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  void _clear() {
    _orders = ObservableList.of([]);
  }
}
