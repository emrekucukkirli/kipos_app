import 'package:flutter/material.dart';
import 'package:kipos_app/models/recipe_model.dart';
import 'package:kipos_app/services/dbhelper.dart';

import 'drawer_widget.dart';

class RecipeView extends StatefulWidget {
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final dbHelper = DatabaseHelper.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Recipe> recipes = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController contentUpdateController = TextEditingController();

  TextEditingController idDeleteController = TextEditingController();

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Gelen Tarifler'),
          centerTitle: true,
          backgroundColor: Colors.red,
          bottom: TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                color: Colors.white),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Ekle"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Listele"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Güncelle"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Sil"),
                ),
              ),
            ],
          ),
        ),
        drawer: KiposDrawer(),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Tarif Başlığı"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: contentController,
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Tarif İçeriği"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      String content = contentController.text;
                      _insert(name, content);
                    },
                    child: Text("Tarif Ekle"),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: recipes.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == recipes.length) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },
                      child: Text("Yenile"),
                    );
                  }
                  return Container(
                    child: Center(
                      child: Text(
                        '[${recipes[index].id}] - ${recipes[index].name} \t ${recipes[index].content}',
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                  );
                },
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: idUpdateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tarif No:',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: nameUpdateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tarif Başlığı',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        controller: contentUpdateController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tarif İçeriği',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text('Tarifi Güncelle'),
                      onPressed: () {
                        int id = int.parse(idUpdateController.text);
                        String name = nameUpdateController.text;
                        int content = int.parse(contentUpdateController.text);
                        _update(id, name, content);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: idDeleteController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tarif No',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Sil'),
                    onPressed: () {
                      int id = int.parse(idDeleteController.text);
                      _delete(id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _insert(String name, String content) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnContent: content,
    };

    Recipe recipe = Recipe.fromMap(row);
    final id = await dbHelper.insert(recipe);
    _showMessageInScaffold('Tarif Eklendi: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    recipes.clear();
    allRows.forEach((row) => recipes.add(Recipe.fromMap(row)));
    _showMessageInScaffold("Tarifler Başarıyla Listelendi");
    setState(() {});
  }

  void _update(id, name, content) async {
    Recipe recipe = Recipe(id, name, content);
    final rowsAffected = await dbHelper.update(recipe);
    _showMessageInScaffold('$rowsAffected row(s) güncellendi');
  }

  void _delete(id) async {
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold('$rowsDeleted row(s): row $id silindi');
  }
}
