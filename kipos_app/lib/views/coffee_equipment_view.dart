import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_equipment_model.dart';
import 'package:kipos_app/services/coffee_equipment_services.dart';

import 'coffee_equipment_detail.dart';

class CoffeeEquipmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<CoffeeEquipment>>(
          future: CoffeeEquipmentServices.getUsersLocally(context),
          builder: (context, product) {
            final coffeeEquipments = product.data;

            switch (product.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (product.hasError) {
                  return Center(child: Text('Hata'));
                } else {
                  return buildCoffeeEquipments(coffeeEquipments);
                }
            }
          },
        ),
      );

  Widget buildCoffeeEquipments(List<CoffeeEquipment> coffeeEquipments) =>
      GridView.builder(
        // padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: coffeeEquipments.length,
        itemBuilder: (context, index) {
          final coffeeEquipment = coffeeEquipments[index];
          return Container(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CoffeeEquipmentPage(coffeeEquipment: coffeeEquipment),
                ),
              ),
              title: Text(
                coffeeEquipment.name,
                softWrap: true,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  // backgroundColor: Colors.grey
                ),
              ),
              // tileColor: ,
            ),
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
              image:
                  DecorationImage(image: NetworkImage(coffeeEquipment.imgurl)),
            ),
          );
        },
      );
}
