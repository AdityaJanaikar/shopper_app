import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ShoppingCart.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.blue[600],
      ),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: CartList(),
              ),
            ),
            const Divider(height: 3, color: Colors.black),
            CartTotal()
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<ShoppingCart>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}
class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    var hugeStyle =
    Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 45);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            Consumer<ShoppingCart>(
                builder: (context, cart, child) =>
                    Text('\₹${cart.totalPrice}', style: hugeStyle)),
            const SizedBox(width: 25),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Your order has been placed')));
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}