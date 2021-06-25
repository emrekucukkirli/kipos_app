import 'package:flutter/material.dart';
import 'package:kipos_app/models/tea_model.dart';
import 'package:kipos_app/services/tea_services.dart';
import 'package:kipos_app/views/drawer_widget.dart';
import 'package:kipos_app/views/tea_detail.dart';

class TeaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Çaylar'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: FutureBuilder<List<Tea>>(
          future: CoffeeServices.getUsersLocally(context),
          builder: (context, product) {
            final teas = product.data;

            switch (product.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (product.hasError) {
                  return Center(child: Text('Hata'));
                } else {
                  return buildTeas(teas);
                }
            }
          },
        ),
      );

  Widget buildTeas(List<Tea> teas) => GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 2 / 6,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          mainAxisExtent: 520,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: teas.length,
        itemBuilder: (context, index) {
          final tea = teas[index];
          return Container(
            alignment: Alignment.bottomCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => TeaPage(tea: tea),
                      ),
                    ),
                    title: Text(
                      tea.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(tea.taste),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'İçerik : ' + tea.contents,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Image.network(
                    tea.imgurl,
                  ),
                ],
              ),
            ),
          );
        },
      );
}
