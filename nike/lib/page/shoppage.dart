import 'package:flutter/material.dart';
import 'package:nike/components/shoe_tile.dart';
import 'package:nike/models/cart.dart';
import 'package:nike/models/shoe.dart';
import 'package:provider/provider.dart';

class Shoppage extends StatefulWidget {
  const Shoppage({super.key});

  @override
  State<Shoppage> createState() => _ShoppageState();
}

class _ShoppageState extends State<Shoppage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Succesfuly added!"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("search"),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text("everyone flies.. some fly longer than others",
                style: TextStyle(color: Colors.grey.shade600)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hot Picks🔥",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShoeList()[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
