import 'package:artisan/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //customize sweetness(acoustics/interests slider)
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  //customize ice(field talent slider)
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  //addtocart
  void addToCart() {
    //firstly add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addtoCart(widget.drink);

    //direct user back to shop page
    Navigator.pop(context);

    //let user know that it was successful
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully messaged the artisan'),
      ),
    );
  }

  //order sweetness(popularity/reach slider)
  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          //drink image(profile picture)
          Image.asset(widget.drink.imagePath),
          //sliders to customize the drink(show interest in collab)
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //sweetness slider(acoustics/interests slider)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text("Interest"),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),

                //ice slider(field talent slider)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text("Field Talent"),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                      ),
                    ),
                  ],
                ),

                //pearls slider(popularity/reach slider)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text("Popularity"),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        label: pearlValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearl(value),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          //add to cart button(DM button)
          MaterialButton(
            child: Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepPurpleAccent,
            onPressed: addToCart,
          ),
        ],
      ),
    );
  }
}
