// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CatogoryScreen extends StatelessWidget {
  const CatogoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryHome();
  }
}

class CategoryHome extends StatefulWidget {
  const CategoryHome({super.key});

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    ListView(
      children: foodItems.map((foodItem) {
        return FoodItemCard(foodItem: foodItem);
      }).toList(),
    ),
    Text("Empty for Category"),
    Text("Empty for Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Catagory Page'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/cart");
            },
          )
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.grab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //print('$_selectedIndex' + ' ' + '$index');
    });
  }
}

class FoodItem {
  final String name;
  final String imageUrl;

  FoodItem({required this.name, required this.imageUrl});
}

//"assets/images/logo.png"
final List<FoodItem> foodItems = [
  FoodItem(name: 'Bánh canh', imageUrl: "assets/images/banhcanh.jpg"),
  FoodItem(name: 'Bánh hỏi', imageUrl: "assets/images/banhhoi.jpg"),
  FoodItem(name: 'Bánh xèo', imageUrl: "assets/images/banhxeo.jpg"),
  FoodItem(name: 'Bún bò', imageUrl: "assets/images/bunbo.jpg"),
  FoodItem(name: 'Bánh canh', imageUrl: "assets/images/banhcanh.jpg"),
  FoodItem(name: 'Bánh hỏi', imageUrl: "assets/images/banhhoi.jpg"),
  FoodItem(name: 'Bánh xèo', imageUrl: "assets/images/banhxeo.jpg"),
  FoodItem(name: 'Bún bò', imageUrl: "assets/images/bunbo.jpg"),
  FoodItem(name: 'Bánh canh', imageUrl: "assets/images/banhcanh.jpg"),
  FoodItem(name: 'Bánh hỏi', imageUrl: "assets/images/banhhoi.jpg"),
  FoodItem(name: 'Bánh xèo', imageUrl: "assets/images/banhxeo.jpg"),
  FoodItem(name: 'Bún bò', imageUrl: "assets/images/bunbo.jpg"),
  FoodItem(name: 'Bánh canh', imageUrl: "assets/images/banhcanh.jpg"),
  FoodItem(name: 'Bánh hỏi', imageUrl: "assets/images/banhhoi.jpg"),
  FoodItem(name: 'Bánh xèo', imageUrl: "assets/images/banhxeo.jpg"),
  FoodItem(name: 'Bún bò', imageUrl: "assets/images/bunbo.jpg"),
];

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodItemCard({super.key, required this.foodItem});

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
  const AddButton({super.key});

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
      ],
    );
  }
}
