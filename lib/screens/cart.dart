// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shopping Cart'),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 30),
            child: badges.Badge(
              badgeContent: Text(
                "2",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              badgeStyle: BadgeStyle(
                badgeColor: Colors.amber,
              ),
              position: BadgePosition.topEnd(top: -12),
              child: Row(
                children: [
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
          ),
        ],
      ),
      body: FoodItemList(),
    );
  }
}

class FoodItem {
  final String name;
  final String imageUrl;

  FoodItem({required this.name, required this.imageUrl});
}

final List<FoodItem> foodItems = [
  FoodItem(name: 'Bánh canh', imageUrl: "assets/images/banhcanh.jpg"),
  FoodItem(name: 'Bánh hỏi', imageUrl: "assets/images/banhhoi.jpg"),
  FoodItem(name: 'Bánh xèo', imageUrl: "assets/images/banhxeo.jpg"),
  FoodItem(name: 'Bún bò', imageUrl: "assets/images/bunbo.jpg")
];

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodItemCard({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.asset(foodItem.imageUrl, width: 80, height: 80),
        title: Text(foodItem.name),
        trailing: AddButton(),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  const AddButton({Key? key});

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (quantity > 0) {
              setState(() {
                quantity--;
              });
            }
          },
        ),
        Text(quantity.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}

class FoodItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: foodItems.map((foodItem) {
              return FoodItemCard(foodItem: foodItem);
            }).toList(),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.discount),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Coupon',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {},
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
