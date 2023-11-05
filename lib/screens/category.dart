// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, sized_box_for_whitespace, avoid_print, prefer_final_fields

import 'package:demo_oct_16/model/cart_model.dart';
import 'package:demo_oct_16/database/db_helper.dart';
import 'package:demo_oct_16/model/category_model.dart';
import 'package:demo_oct_16/provider/information_provider.dart';
import 'package:demo_oct_16/provider/list_product_provider.dart';
import 'package:demo_oct_16/screens/profile.dart';
import 'package:demo_oct_16/screens/transaction.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

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
  List<String> _labelList = ["Food Order", "Transaction", "Profile"];
  int _selectedIndex = 0;

  final _pages = <Widget>[
    FoodItemCard(),
    TransactionScreen(),
    MyProfile(),
  ];

  @override
  void initState() {
    super.initState();
    final inforProvider = Provider.of<InforProvider>(context, listen: false);
    inforProvider.loadDataFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(_labelList.elementAt(_selectedIndex)),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            );
          },
        ),
        actions: <Widget>[
          Row(
            children: [
              Visibility(
                visible: _selectedIndex == 0 ? true : false,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: badges.Badge(
                  badgeContent: Consumer<ListProductProvider>(
                    builder: (context, value, child) {
                      return Text(
                        value.getCounter().toString(),
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      );
                    },
                  ),
                  badgeStyle: BadgeStyle(
                    badgeColor: Colors.amber,
                  ),
                  position: BadgePosition.topEnd(top: 2, end: 5),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/cart");
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(219, 32, 69, 90),
        mouseCursor: SystemMouseCursors.grab,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
              color: _selectedIndex == 0
                  ? Color.fromARGB(255, 94, 186, 24)
                  : Color.fromARGB(255, 162, 161, 161),
            ),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.compare_arrows,
              color: _selectedIndex == 1
                  ? Color.fromARGB(255, 94, 186, 24)
                  : Color.fromARGB(255, 162, 161, 161),
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 2
                  ? Color.fromARGB(255, 94, 186, 24)
                  : Color.fromARGB(255, 162, 161, 161),
            ),
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

//"assets/images/logo.png"
final List<FoodItem> listFoodItems = [
  FoodItem(
    productName: 'Bánh canh',
    imageUrl: "assets/images/product/banhcanh.jpg",
    productPrice: 25,
    unitTag: 'Tô',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh xèo',
    imageUrl: "assets/images/product/banhxeo.jpg",
    productPrice: 15,
    unitTag: 'Bánh',
  ),
  FoodItem(
    productName: 'Bún bò',
    imageUrl: "assets/images/product/bunbo.jpg",
    productPrice: 35,
    unitTag: 'Tô',
  ),
  FoodItem(
    productName: 'Bánh mì',
    imageUrl: "assets/images/product/banhmi.jpg",
    productPrice: 15,
    unitTag: 'Cái',
  ),
  FoodItem(
    productName: 'Chuối nướng',
    imageUrl: "assets/images/product/chuoinuong.jpg",
    productPrice: 5,
    unitTag: 'Cái',
  ),
  FoodItem(
    productName: 'Gỏi cuốn',
    imageUrl: "assets/images/product/goicuon.jpg",
    productPrice: 10,
    unitTag: 'Cái',
  ),
  FoodItem(
    productName: 'Khoai tây chiên',
    imageUrl: "assets/images/product/khoaitaychien.jpg",
    productPrice: 15,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Mì Ý',
    imageUrl: "assets/images/product/miy.jpg",
    productPrice: 25,
    unitTag: 'Tô',
  ),
  FoodItem(
    productName: 'Xiên nướng',
    imageUrl: "assets/images/product/xiennuong.jpg",
    productPrice: 30,
    unitTag: 'Phần',
  ),
];

class FoodItemCard extends StatefulWidget {
  const FoodItemCard({super.key});

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  DBHelper dbHelper = DBHelper();
  final foodItems = listFoodItems;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ListProductProvider>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: listFoodItems.length,
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
                            image: AssetImage(listFoodItems[index].imageUrl),
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
                              listFoodItems[index].productName.toString(),
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
                                      listFoodItems[index].unitTag.toString() +
                                      r')',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  r'$ ' +
                                      listFoodItems[index]
                                          .productPrice
                                          .toString(),
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
                        onPressed: () {
                          dbHelper
                              .insert(Cart(
                            id: index,
                            productId: index.toString(),
                            productName:
                                foodItems[index].productName.toString(),
                            initalPrice: foodItems[index].productPrice,
                            productPrice: foodItems[index].productPrice,
                            quanity: 1,
                            unitTag: foodItems[index].unitTag,
                            image: foodItems[index].imageUrl.toString(),
                          ))
                              .then((value) {
                            print('Product added!!');
                            cart.addTotalPrice(double.parse(
                                foodItems[index].productPrice.toString()));
                            cart.addCounter();
                          }).onError((error, stackTrace) {
                            print(error.toString());
                          });
                        },
                        child: Text('Buy'),
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
