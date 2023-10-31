// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:demo_oct_16/model/list_product_provider.dart';
import 'package:demo_oct_16/screens/cart.dart';
import 'package:demo_oct_16/screens/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

//adding comment test
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProductProvider()),
        //more provider if need
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //? route
            initialRoute: '/',
            routes: {
              '/': (context) => MyHomePage(),
              '/category': (context) => CategoryHome(),
              '/cart': (context) => ShoppingCart(),
            },
            //! login page
            // home: ShoppingCart(),
          );
        },
      ),
    );
  }
}
