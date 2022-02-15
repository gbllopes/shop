import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shop/controller/controller_cart_store.dart';

class CartItemWidget extends StatelessWidget {
  final String cartItemProductId;
  const CartItemWidget({
    Key? key,
    required this.cartItemProductId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerCartStore cartController =
        Provider.of<ControllerCartStore>(context);

    return Observer(
      builder: (_) => Dismissible(
        key: ValueKey(cartItemProductId),
        background: Container(
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          color: Theme.of(context).errorColor,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          cartController.removeItemFromCart(cartItemProductId);
          print(cartController.items.length);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 04),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title: Text(cartController.items[cartItemProductId]!.title),
              subtitle: Text(
                  'Total: R\$${(cartController.items[cartItemProductId]!.price * cartController.items[cartItemProductId]!.quantity).toStringAsFixed(2)}'),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cartController.items[cartItemProductId]!.urlImage,
                  width: 65,
                ),
              ),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    // '${cartItem.quantity}x',
                    '${cartController.items[cartItemProductId]!.quantity}x',
                    style: TextStyle(),
                  ),
                  // SizedBox(width: 10),
                  IconButton(
                      onPressed: () {
                        cartController
                            .removeUnityItemFromCart(cartItemProductId);
                      },
                      icon: Icon(Icons.remove_circle_outline_rounded,
                          color: Colors.redAccent))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
