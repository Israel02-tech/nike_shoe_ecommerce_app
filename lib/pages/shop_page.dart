// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:Text('Successfully Added'),
        content: Text('Check your Cart'),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
        //search bar
         Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
              style: TextStyle(color: Colors.grey,
             // fontWeight: FontWeight.bold,
              ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
                ),
            ],
          ),
          ),

        // message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Everyone flies..... ',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              TextSpan(
                text: 'some fly longer than the others',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic, // This will make the text italicized
                ),
              ),
            ],
          ),
        ),

        ),

        //hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.end,
            children: [
              //The reason for using this rich text is that When i use the normal text formatting the there was some unusual or unnecessary spacing between Hot and Picks and this was due to the use of emoji, the emoji family has a default spacing which is disrupting the appearance or spacing between the Hot and Pics
              //In order to address the issue i use the Rich text to manually space each of the text and also control the default spacing format of the NotoColorEmoji
            RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Hot', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                    WidgetSpan(
                      child: SizedBox(width: 8), // add some spacing between "Hot" and "Picks"
                    ),
                    TextSpan(text: 'Picks', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                    WidgetSpan(
                      child: SizedBox(width: 1), // add some spacing before the fire emoji
                    ),
                    TextSpan(text: String.fromCharCode(0x1F525), style: TextStyle(fontFamily: 'NotoColorEmoji', fontSize: 18),
                    ),
                     WidgetSpan(
                      child: SizedBox(width: 10), // add some spacing between "Hot" and "Picks"
                    ),
                  ],
                ),
              ),
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue)),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // List of shoes for sale
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {

              //create a shoe form shop list
              Shoe shoe = value.getShoeList()[index];

                // return the shoe
              return ShoeTile(
                shoe: shoe,
                onTap: () => addShoeToCart(shoe),
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
      ],
    ),
    );
  }
}