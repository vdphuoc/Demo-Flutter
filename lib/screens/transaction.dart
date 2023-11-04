// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:demo_oct_16/model/transaction_model.dart';
import 'package:demo_oct_16/provider/authenticate_provider.dart';
import 'package:demo_oct_16/provider/information_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

List<TransactionInfo> _listPayment = [
  TransactionInfo(
    name: 'User 1',
    price: 25,
    date: '01/01/2000',
    paymentMethod: 'Cash',
  ),
  TransactionInfo(
    name: 'User 2',
    price: -50,
    date: '01/01/2001',
    paymentMethod: 'Card',
  ),
  TransactionInfo(
    name: 'User 1',
    price: 15,
    date: '01/01/2023',
    paymentMethod: 'Card',
  ),
  TransactionInfo(
    name: 'User 2',
    price: -50,
    date: '01/01/2001',
    paymentMethod: 'Card',
  ),
  TransactionInfo(
    name: 'User 1',
    price: 15,
    date: '01/01/2023',
    paymentMethod: 'Card',
  ),
  TransactionInfo(
    name: 'User 2',
    price: -50,
    date: '01/01/2001',
    paymentMethod: 'Card',
  ),
  TransactionInfo(
    name: 'User 1',
    price: 15,
    date: '01/01/2023',
    paymentMethod: 'Card',
  ),
  TransactionInfo(
    name: 'User 2',
    price: -50,
    date: '01/01/2001',
    paymentMethod: 'Card',
  ),
  TransactionInfo(
    name: 'User 1',
    price: 15,
    date: '01/01/2023',
    paymentMethod: 'Card',
  ),
];

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 199, 221, 236),
            Color.fromARGB(255, 165, 211, 168)
          ], // Replace gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer<InforProvider>(
            builder: (context, value, child) {
              value.loadDataFromJson();
              return Text(
                r'Hi, ' + value.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 33, 57, 77),
                ),
              );
            },
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r'Balance: $ 100.00',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 36, 122, 37),
                ),
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {},
              ),
            ],
          ),
          // SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: double.infinity),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1),
              ),
              child: ListView.builder(
                itemCount: _listPayment.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(2),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5.0), // Adjust the radius as needed
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 199, 221, 236),
                              Color.fromARGB(255, 152, 185, 224)
                            ], // Replace gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      _listPayment[index].price > 0
                                          ? Text(
                                              r"+  $ ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text(
                                              r"-  $ ",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                      _listPayment[index].price > 0
                                          ? Text(
                                              _listPayment[index]
                                                  .price
                                                  .abs()
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Text(
                                              _listPayment[index]
                                                  .price
                                                  .abs()
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ],
                                  ),
                                  Text(
                                    _listPayment[index]
                                        .paymentMethod
                                        .toString(),
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                r'Note: ' + _listPayment[index].name.toString(),
                              ),
                              SizedBox(height: 5),
                              Text(
                                r'Date: ' + _listPayment[index].date.toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
