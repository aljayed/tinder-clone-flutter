// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, list_remove_unrelated_type, unnecessary_new

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tinder_clone_project/controller/home_controller.dart';
import 'package:tinder_clone_project/widgets/nav_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCardIndex = 0;
  HomeController homeController = HomeController();
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late final MatchEngine _matchEngine;
  final List<String> _names = [
    "Red",
    "Pink",
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange"
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.pink,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          //this is where I have to put all the items to the card widget.
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            print('right $i');
          },
          nopeAction: () {
            
          },
          superlikeAction: () {},
          onSlideUpdate: (SlideRegion? region) async {}));
    }

    _matchEngine = MatchEngine(
      swipeItems: _swipeItems,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_list_rounded),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            )
          ],
          title: Text('Sweetmeet Clone'),
          backgroundColor: Colors.grey[900],
          elevation: 0,
        ),
        drawer: NavigationDrawerWidget(homeController: homeController),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://picsum.photos/536/354',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        _swipeItems[index].content.text,
                        style: TextStyle(fontSize: 100, color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
              onStackFinished: () {},
              itemChanged: (SwipeItem item, int index) {
                
              },
              upSwipeAllowed: false,
              fillSpace: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.replay_rounded,
                  size: 32,
                  color: Colors.grey[800],
                ),
                backgroundColor: Colors.grey[900],
              ),
              FloatingActionButton(
                onPressed: () {
                  _swipeItems[0].nope();
                  
                },
                child: Icon(
                  Icons.close,
                  size: 32,
                  color: Colors.grey[500],
                ),
                backgroundColor: Colors.white,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.favorite_sharp,
                  size: 28,
                  color: Colors.grey[400],
                ),
                backgroundColor: Colors.white,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.send,
                ),
                backgroundColor: Colors.pink[400],
              ),
            ],
          )
        ]));
  }
}

// class Content {
//   final String gender;
//   final String name;
//   final int age;
//   final String location;
//   final int photoCount;
//   final int distance;

//   Content({
//     required this.gender,
//     required this.name,
//     required this.age,
//     required this.location,
//     required this.photoCount,
//     required this.distance,
//   });
// }

class Content {
  final String text;
  final Color color;

  Content({
    required this.text,
    required this.color,
  });
}

