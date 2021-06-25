import 'package:flutter/material.dart';
import 'package:kipos_app/models/mocktail_model.dart';
import 'package:kipos_app/services/mocktail_services.dart';
import 'package:kipos_app/views/drawer_widget.dart';

import 'moctail_detail.dart';

class MocktailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Mocktailler'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: FutureBuilder<List<Mocktail>>(
          future: MocktailServices.getUsersLocally(context),
          builder: (context, product) {
            final mocktails = product.data;

            switch (product.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (product.hasError) {
                  return Center(child: Text('Hata'));
                } else {
                  return buildMocktails(mocktails);
                }
            }
          },
        ),
      );

  Widget buildMocktails(List<Mocktail> mocktails) => GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 2 / 6,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          mainAxisExtent: 580,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: mocktails.length,
        itemBuilder: (context, index) {
          final mocktail = mocktails[index];
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
                            MocktailPage(mocktail: mocktail),
                      ),
                    ),
                    title: Text(
                      mocktail.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.network(
                    mocktail.imgurl,
                  ),
                ],
              ),
            ),
          );
        },
      );
}
