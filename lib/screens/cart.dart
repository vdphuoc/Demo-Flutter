// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

import 'package:badges/badges.dart';
import 'package:demo_oct_16/model/cart_model.dart';
import 'package:demo_oct_16/database/db_helper.dart';
import 'package:demo_oct_16/provider/list_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ListProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Shopping Cart'),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20),
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
              position: BadgePosition.topEnd(top: -9, end: -7),
              child: Row(
                children: [
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListItemInCart(),
    );
  }
}

class FoodItem {
  final String productName;
  final String imageUrl;
  final int productPrice;
  final String unitTag;

  FoodItem(
      {required this.productName,
      required this.productPrice,
      required this.unitTag,
      required this.imageUrl});
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
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
  FoodItem(
    productName: 'Bánh hỏi',
    imageUrl: "assets/images/product/banhhoi.jpg",
    productPrice: 20,
    unitTag: 'Phần',
  ),
];

class ListItemInCart extends StatefulWidget {
  const ListItemInCart({super.key});
  @override
  State<ListItemInCart> createState() => _ListItemInCartState();
}

class _ListItemInCartState extends State<ListItemInCart> {
  DBHelper dbHelper = DBHelper();
  final foodItems = listFoodItems;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ListProductProvider>(context);
    return FutureBuilder(
      future: cart.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            Future.delayed(Duration.zero, () {
              cart.resetTotalPrice();
            });
            return Center(
              child: Image(
                image: AssetImage("assets/images/system/empty_cart.png"),
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.8, color: Colors.amber),
                                    borderRadius: BorderRadius.circular(5)),
                                width: 100,
                                height: 68,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image(
                                    image:
                                        AssetImage(snapshot.data![index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].productName
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          r'(' +
                                              snapshot.data![index].unitTag
                                                  .toString() +
                                              r')',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          r'$ ' +
                                              snapshot.data![index].productPrice
                                                  .toString(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        dbHelper
                                            .delete(snapshot.data![index].id);
                                        cart.minusCounter();
                                        //!!!!!! need check
                                        cart.minusTotalPrice(double.parse(
                                            snapshot.data![index].productPrice
                                                .toString()));
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(0),
                                              backgroundColor: Colors.green,
                                            ),
                                            child: Icon(Icons.remove),
                                            onPressed: () {
                                              int quanity =
                                                  snapshot.data![index].quanity;
                                              int price = snapshot
                                                  .data![index].initalPrice;
                                              quanity--;
                                              int? newPrice = price * quanity;
                                              if (quanity > 0) {
                                                dbHelper
                                                    .updateQuanity(
                                                  Cart(
                                                      id: snapshot
                                                          .data![index].id,
                                                      productId: snapshot
                                                          .data![index]
                                                          .productId,
                                                      productName: snapshot
                                                          .data![index]
                                                          .productName,
                                                      initalPrice: snapshot
                                                          .data![index]
                                                          .initalPrice,
                                                      productPrice: newPrice,
                                                      quanity: quanity,
                                                      unitTag: snapshot
                                                          .data![index].unitTag,
                                                      image: snapshot
                                                          .data![index].image),
                                                )
                                                    .then((value) {
                                                  quanity = 0;
                                                  newPrice = 0;

                                                  cart.minusTotalPrice(
                                                      double.parse(snapshot
                                                          .data![index]
                                                          .initalPrice
                                                          .toString()));
                                                }).catchError((e) {
                                                  print(
                                                      'Minus button Error:  $e.toString()');
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 13),
                                        Text(
                                          snapshot.data![index].quanity
                                              .toString(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(width: 13),
                                        SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(0),
                                              backgroundColor: Colors.green,
                                            ),
                                            child: Icon(Icons.add),
                                            onPressed: () {
                                              int quanity =
                                                  snapshot.data![index].quanity;
                                              int price = snapshot
                                                  .data![index].initalPrice;
                                              quanity++;
                                              int? newPrice = price * quanity;

                                              dbHelper
                                                  .updateQuanity(
                                                Cart(
                                                    id: snapshot
                                                        .data![index].id,
                                                    productId: snapshot
                                                        .data![index].productId,
                                                    productName: snapshot
                                                        .data![index]
                                                        .productName,
                                                    initalPrice: snapshot
                                                        .data![index]
                                                        .initalPrice,
                                                    productPrice: newPrice,
                                                    quanity: quanity,
                                                    unitTag: snapshot
                                                        .data![index].unitTag,
                                                    image: snapshot
                                                        .data![index].image),
                                              )
                                                  .then((value) {
                                                quanity = 0;
                                                newPrice = 0;

                                                cart.addTotalPrice(double.parse(
                                                    snapshot.data![index]
                                                        .initalPrice
                                                        .toString()));
                                              }).catchError((e) {
                                                print(
                                                    'Add button Error:  $e.toString()');
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8, left: 5, right: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            r'$ ' + (cart.getTotalPrice().toStringAsFixed(2)),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            r'$ ' + cart.getTotalDiscount().toStringAsFixed(2),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total: ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            r'$ ' + cart.getTotalPrice().toStringAsFixed(2),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
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
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
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
        } else {
          return Center(
            child: Text('Can not load list Element'),
          );
        }
      },
    );
  }
}
