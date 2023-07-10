import 'package:artisan/components/drink_tile.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: const [
            //heading
            Text(
              'Your DMs',
              style: TextStyle(fontSize: 20),
            )

            //list of cart items(different artisans)
            //Expanded(child: ListView.builder(itemBuilder: (context, index) => DrinkTile(drink: drink, onTap: onTap, trailing: trailing),),)

            //pay
          ],
        ),
      ),
    );
  }
}
