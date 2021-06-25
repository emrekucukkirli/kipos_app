import 'package:flutter/material.dart';
import 'package:kipos_app/models/dessert_model.dart';

import 'drawer_widget.dart';

class DessertPage extends StatelessWidget {
  final Dessert dessert;

  const DessertPage({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(dessert.name),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(dessert.imgurl),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Title(
                  color: Colors.red,
                  child: Text(
                    dessert.name,
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
                        "İçindekiler",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        dessert.contents,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Hazırlanışı",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        dessert.preparing,
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
