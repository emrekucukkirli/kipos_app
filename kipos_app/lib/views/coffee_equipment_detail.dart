import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_equipment_model.dart';

class CoffeeEquipmentPage extends StatelessWidget {
  final CoffeeEquipment coffeeEquipment;

  const CoffeeEquipmentPage({
    Key key,
    @required this.coffeeEquipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(coffeeEquipment.name),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(coffeeEquipment.imgurl),
                height: MediaQuery.of(context).size.height * .5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Title(
                  color: Colors.red,
                  child: Text(
                    coffeeEquipment.name,
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
                        coffeeEquipment.description,
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
