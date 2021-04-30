import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_brew_model.dart';

class CoffeeBrewPage extends StatelessWidget {
  final CoffeeBrew coffeebrew;

  const CoffeeBrewPage({
    Key key,
    @required this.coffeebrew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(coffeebrew.title),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(coffeebrew.imgurl),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Title(
                  color: Colors.red,
                  child: Text(
                    coffeebrew.title,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Detaylar",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        coffeebrew.body,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
