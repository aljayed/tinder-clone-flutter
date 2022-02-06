// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder_clone_project/controller/home_controller.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.pinkAccent),
          accountName: Text("Shakib Al Hasan"),
          accountEmail: Text("shakibalhasan@gmail.com"),
          currentAccountPicture: Obx(()=>
            GestureDetector(
              onTap: () async {
                homeController.getImage(ImageSource.gallery);
              },
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                foregroundImage: homeController.pickedImagePath.value=='' ? null:
                Image.file(File(homeController.pickedImagePath.value)).image,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 3'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 4'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 5'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
      );
  }
}