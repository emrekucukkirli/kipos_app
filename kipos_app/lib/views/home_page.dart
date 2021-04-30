import 'package:flutter/material.dart';
import 'package:kipos_app/views/about.dart';
import 'package:kipos_app/views/guide_view.dart';
import 'package:kipos_app/views/post_view.dart';
import 'package:kipos_app/views/product_coffee_view.dart';
import 'package:kipos_app/views/tea_view.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentIndex = 0;

  final tabs = [
    Center(
      child: ProductCoffeeView(),
    ),
    Center(
      child: TeaView(),
    ),
    Center(
      child: PostView(),
    ),
    Center(
      child: GuideView(),
    ),
    Center(
      child: AboutView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.grey[400],
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.free_breakfast_rounded),
            label: 'Kahveler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_food_beverage_sharp),
            label: 'Çaylar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Rehber',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Hakkında',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
