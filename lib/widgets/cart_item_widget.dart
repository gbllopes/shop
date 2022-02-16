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
        confirmDismiss: (_) {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Tem certeza?'),
                    content: Text('Quer remover o item do carrinho?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('Não')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Sim')),
                    ],
                  ));
        },
        onDismissed: (_) {
          cartController.removeItemFromCart(cartItemProductId);
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 04),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title: Text(cartController.items[cartItemProductId]!.title),
              subtitle: Text(
                  'Total: R\$${(cartController.items[cartItemProductId]!.price * cartController.items[cartItemProductId]!.quantity).toStringAsFixed(2)}'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    cartController.items[cartItemProductId]!.urlImage),
              ),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${cartController.items[cartItemProductId]!.quantity}x',
                    style: TextStyle(),
                  ),
                  if (cartController.items[cartItemProductId]!.quantity >
                      1) ...[
                    IconButton(
                        onPressed: () {
                          cartController
                              .removeUnityItemFromCart(cartItemProductId);
                        },
                        icon: Icon(Icons.remove_circle_outline_rounded,
                            color: Colors.redAccent))
                  ] else ...[
                    SizedBox(width: 50)
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
