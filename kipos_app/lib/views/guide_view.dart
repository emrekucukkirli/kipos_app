import 'package:flutter/material.dart';
import 'package:kipos_app/views/coffee_brew_view.dart';
import 'package:kipos_app/views/tea_brew_view.dart';
import 'package:kipos_app/views/timer_view.dart';

class GuideView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Demleme Rehberi'),
            centerTitle: true,
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: Colors.orange,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  child: Text(
                    "Kahve",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Çay",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Brew Timer",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CoffeeBrewView(),
              TeaBrewView(),
              TimerView(),
            ],
          ),
        ),
      ),
    );
  }
}
