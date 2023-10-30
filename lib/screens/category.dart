// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, sized_box_for_whitespace

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
    FoodItemCard(),
    Text("Empty for Category"),
    Text("Empty for Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
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
              Navigator.pushNamed(context, "/cart");
            },
          )
        ],
      ),
      body: Container(
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
  final String productName;
  final String imageUrl;
  final int productprice;
  final String unitTag;

  FoodItem(
      {required this.productName,
      required this.productprice,
      required this.unitTag,
      required this.imageUrl});
}

//"assets/images/logo.png"
final List<FoodItem> foodItems = [
  FoodItem(
    productName: 'Bánh canh',
    imageUrl: "assets/images/banhcanh.jpg",
    productprice: 5,
    unitTag: 'Tô',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/banhhoi.jpg",
    productprice: 8,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh xèo',
    imageUrl: "assets/images/banhxeo.jpg",
    productprice: 3,
    unitTag: 'Bánh',
  ),
  FoodItem(
    productName: 'Bún bò',
    imageUrl: "assets/images/bunbo.jpg",
    productprice: 5,
    unitTag: 'Tô',
  ),
];

class FoodItemCard extends StatelessWidget {
  const FoodItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.8, color: Colors.amber),
                            borderRadius: BorderRadius.circular(5)),
                        width: 100,
                        height: 68,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: AssetImage(foodItems[index].imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foodItems[index].productName.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  r'(' +
                                      foodItems[index].unitTag.toString() +
                                      r')',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  foodItems[index].productprice.toString() +
                                      r' VND',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        onPressed: () {},
                        child: Text('Mua'),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
