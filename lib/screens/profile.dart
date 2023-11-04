// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:ui';

import 'package:demo_oct_16/provider/information_provider.dart';
import 'package:demo_oct_16/provider/profilepage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum GenderOption { male, female }

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  GenderOption? _gender = GenderOption.male;

  @override
  Widget build(BuildContext context) {
    final pageModel = Provider.of<ProfileProvider>(context);

    return SingleChildScrollView(
      child: Container(
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
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(1.0, 1.0), // shadow direction: bottom right
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage("assets/images/user/avatar1.jpg"))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber),
                    child: const Icon(
                      Icons.create,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.amber,
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                pageModel.toggleEditing();
              },
              child: Text(pageModel.btnValue),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  child: Text(
                    'Username ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Consumer<InforProvider>(
                    builder: (context, value, child) {
                      value.loadDataFromJson();

                      return TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Username',
                        ),
                        initialValue: value.username,
                        onChanged: (value) {},
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  child: Text('Fullname ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 5),
                Expanded(child: Consumer<InforProvider>(
                  builder: (context, value, child) {
                    return TextFormField(
                      enabled: pageModel.isEditing,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                      ),
                      initialValue: value.name,
                    );
                  },
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  child: Text('Gender ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: RadioListTile<GenderOption>(
                    title: Text("Male"),
                    value: GenderOption.male,
                    groupValue: _gender,
                    onChanged: (GenderOption? value) {
                      setState(() {
                        _gender = value;
                        print("male clicked $_gender");
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<GenderOption>(
                    title: Text("Female"),
                    value: GenderOption.female,
                    groupValue: _gender,
                    onChanged: (GenderOption? value) {
                      setState(() {
                        _gender = value;
                        print("female clicked $_gender");
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  child: Text('Birth ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Consumer<InforProvider>(
                    builder: (context, value, child) {
                      return TextFormField(
                        enabled: pageModel.isEditing,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '**/**/****',
                        ),
                        initialValue: value.birth,
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
