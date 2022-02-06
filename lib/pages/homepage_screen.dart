// ignore_for_file: prefer_const_constructors, unnecessary_new, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:get/get.dart';
import 'package:tinder_clone_project/controller/home_controller.dart';
import 'package:tinder_clone_project/controller/user_model.dart';
import 'package:tinder_clone_project/widgets/nav_drawer.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {


  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    CardController cardController = CardController();

    List<String> welcomeImages = [
      "https://picsum.photos/536/354",
      "https://picsum.photos/510/320",
      "https://picsum.photos/536/354",
      "https://picsum.photos/524/330",
      "https://picsum.photos/536/354",
    ];

    List<UserModel> users = <UserModel>[];
    

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: SwipingCard(
                  cardController: cardController, welcomeImages: welcomeImages),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Get.snackbar("Not Found", "Sorry, the card was not found",
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.blueGrey);
                  },
                  child: Icon(
                    Icons.replay_rounded,
                    size: 32,
                    color: Colors.grey[800],
                  ),
                  backgroundColor: Colors.grey[900],
                ),
                FloatingActionButton(
                  onPressed: () {
                    cardController.triggerLeft();
                  },
                  child: Icon(
                    Icons.close,
                    size: 32,
                    color: Colors.grey[500],
                  ),
                  backgroundColor: Colors.white,
                ),
                FloatingActionButton(
                  onPressed: () {
                    cardController.triggerRight();
                  },
                  child: Icon(
                    Icons.favorite_sharp,
                    size: 28,
                    color: Colors.grey[400],
                  ),
                  backgroundColor: Colors.white,
                ),
                FloatingActionButton(
                  onPressed: () {
                    //send message to the person
                  },
                  child: Icon(
                    Icons.send,
                  ),
                  backgroundColor: Colors.pink[400],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SwipingCard extends StatefulWidget {
  const SwipingCard({
    Key? key,
    required this.cardController,
    required this.welcomeImages,
  }) : super(key: key);

  final CardController cardController;
  final List<String> welcomeImages;

  @override
  State<SwipingCard> createState() => _SwipingCardState();
}

class _SwipingCardState extends State<SwipingCard> {
  int currentCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TinderSwapCard(
      cardController: widget.cardController,
      orientation: AmassOrientation.BOTTOM,
      totalNum: widget.welcomeImages.length,
      stackNum: 3,
      swipeEdge: 4.0,
      maxWidth: MediaQuery.of(context).size.width * 0.9,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      minHeight: MediaQuery.of(context).size.height * 0.8,
      cardBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                widget.welcomeImages[index],
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
      swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
        /// Get swiping card's alignment
        if (align.x < 0) {
          //print("Card is LEFT swiping");
        } else if (align.x > 0) {
          //print("Card is RIGHT swiping");
        }
      },
      swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
        setState(() {
          currentCardIndex = index;
        });
        if (orientation == CardSwipeOrientation.LEFT) {
          dislikeMethod(currentCardIndex);
        } else if (orientation == CardSwipeOrientation.RIGHT) {
          likeMethod(currentCardIndex);
        }
      },
    );
  }
}

void dislikeMethod(int currentCardIndex) {
  //Dislike method
  print("Card $currentCardIndex was disliked");
}

void likeMethod(int currentCardIndex) {
  //Like method
  print("Card $currentCardIndex was liked");
}
