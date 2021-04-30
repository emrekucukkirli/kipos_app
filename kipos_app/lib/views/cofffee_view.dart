import 'package:flutter/material.dart';
import 'package:kipos_app/models/coffee_model.dart';
import 'package:kipos_app/services/coffee_services.dart';

import 'coffee_detail.dart';

class CoffeeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Coffee>>(
          future: CoffeeServices.getUsersLocally(context),
          builder: (context, product) {
            final coffees = product.data;

            switch (product.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (product.hasError) {
                  return Center(child: Text('Hata'));
                } else {
                  return buildCoffees(coffees);
                }
            }
          },
        ),
      );

  Widget buildCoffees(List<Coffee> coffees) => GridView.builder(
        padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 2 / 6,
          crossAxisSpacing: 0,
          mainAxisSpacing: 20,
          mainAxisExtent: 520,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          final coffee = coffees[index];
          return Container(
            alignment: Alignment.bottomCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CoffeePage(coffee: coffee),
                      ),
                    ),
                    title: Text(
                      coffee.name + " " + coffee.subname,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Cuping Score : ' + coffee.cupingScore,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Notalar : ' + coffee.tastingNotes,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Image.network(
                    coffee.imgurl,
                  ),
                ],
              ),
            ),
          );
        },
      );
}
// child: ListTile(
//   onTap: () => Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (BuildContext context) => CoffeePage(coffee: coffee),
//     ),
//   ),
//   title: Text(
//     coffee.name,
//     softWrap: true,
//     style: TextStyle(
//       color: Colors.white,
//       fontSize: 22,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
//   subtitle: Text(
//     coffee.subname,
//     style: TextStyle(
//       color: Colors.grey[200],
//       fontSize: 16,
//     ),
//   ),
//   trailing: Text(
//     coffee.cupingScore,
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 18,
//         fontWeight: FontWeight.bold),
//   ),
//   // tileColor: ,
// ),
// decoration: BoxDecoration(
//   borderRadius: BorderRadius.circular(5),
//   image: DecorationImage(image: NetworkImage(coffee.imgurl)),
// ),
