import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kipos_app/models/dessert_model.dart';

import 'dessert_detail.dart';
import 'drawer_widget.dart';

class DessertView extends StatefulWidget {
  @override
  _DessertViewState createState() => _DessertViewState();
}

class _DessertViewState extends State<DessertView> {
  final url = Uri.parse('https://kodemre.com/dessert_data.json');
  int counter;
  var dessert;

  Future callDessert() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = dessertFromJson(response.body);
        if (mounted) {
          setState(() {
            counter = result.length;
            dessert = result;
          });
          return result;
        }
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    callDessert();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tatlılar'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: KiposDrawer(),
      body: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: (3 / 2),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        children: List.generate(
          counter,
          (index) {
            return Center(
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DessertPage(dessert: dessert[index]),
                        ),
                      ),
                      title: Text(
                        dessert[index].name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.network(
                      dessert[index].imgurl,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
