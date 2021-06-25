import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_model.dart';

import 'drawer_widget.dart';

class CoffeePage extends StatelessWidget {
  final Coffee coffee;

  const CoffeePage({
    Key key,
    @required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(coffee.name + ' ' + coffee.subname),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(coffee.imgurl),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Title(
                  color: Colors.red,
                  child: Text(
                    coffee.name + ' ' + coffee.subname,
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
                    ListTile(
                      leading: Text(
                        "Kıta",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.continent,
                        style: TextStyle(fontSize: 20),
                      ),
                      tileColor: Colors.grey[200],
                    ),
                    ListTile(
                      leading: Text(
                        "Ülke",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.country,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Sınıflandırma",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.classification,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tileColor: Colors.grey[200],
                    ),
                    ListTile(
                      leading: Text(
                        "Bölge",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.region,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Botanik Çeşit",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.botanic,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tileColor: Colors.grey[200],
                    ),
                    ListTile(
                      leading: Text(
                        "İşlem",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.operation,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Gövde",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.body,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tileColor: Colors.grey[200],
                    ),
                    ListTile(
                      leading: Text(
                        "Asidite",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.acidity,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Cuping Skoru",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        coffee.cupingScore,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      tileColor: Colors.grey[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Tadım Notaları",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      coffee.tastingNotes,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Açıklama",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      coffee.description,
                      style: TextStyle(
                        fontSize: 20,
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
