import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_brew_model.dart';
import 'package:kipos_app/services/coffee_brew_services.dart';

import 'coffee_brew_detail.dart';

class CoffeeBrewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<CoffeeBrew>>(
          future: CoffeeBrewServices.getUsersLocally(context),
          builder: (context, product) {
            final coffeebrews = product.data;

            switch (product.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (product.hasError) {
                  return Center(child: Text('Hata'));
                } else {
                  return buildCoffeeBrews(coffeebrews);
                }
            }
          },
        ),
      );

  Widget buildCoffeeBrews(List<CoffeeBrew> coffeebrews) => GridView.builder(
        // padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 4.3 / 6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: coffeebrews.length,
        itemBuilder: (context, index) {
          final coffeebrew = coffeebrews[index];
          return Container(
            alignment: Alignment.bottomLeft,
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CoffeeBrewPage(coffeebrew: coffeebrew),
                ),
              ),
              leading: Text(
                coffeebrew.title,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.red,
                ),
              ),
              // tileColor: ,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: NetworkImage(coffeebrew.imgurl)),
            ),
          );
        },
      );
}
