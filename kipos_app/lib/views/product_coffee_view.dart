import 'package:flutter/material.dart';
import 'package:kipos_app/views/coffee_equipment_view.dart';
import 'package:kipos_app/views/cofffee_view.dart';

class ProductCoffeeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Kahve'),
            centerTitle: true,
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: Colors.orange,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  child: Text(
                    "Çekirdekler",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Ekipmanlar",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CoffeeView(),
              CoffeeEquipmentView(),
            ],
          ),
        ),
      ),
    );
  }
}
