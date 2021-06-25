import 'package:flutter/material.dart';
import 'package:kipos_app/services/auth_services.dart';
import 'package:kipos_app/views/about.dart';
import 'package:kipos_app/views/companies_view.dart';
import 'package:kipos_app/views/dessert_view.dart';
import 'package:kipos_app/views/enter_page.dart';
import 'package:kipos_app/views/home_page.dart';
import 'package:kipos_app/views/mocktail_view.dart';
import 'package:kipos_app/views/post_view.dart';
import 'package:kipos_app/views/product_coffee_view.dart';
import 'package:kipos_app/views/questions_view.dart';
import 'package:kipos_app/views/recipe_view.dart';
import 'package:kipos_app/views/tea_view.dart';
import 'package:kipos_app/views/vlog_view.dart';

import 'guide_view.dart';

class KiposDrawer extends StatefulWidget {
  @override
  _KiposDrawerState createState() => _KiposDrawerState();
}

class _KiposDrawerState extends State<KiposDrawer> {
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.free_breakfast_outlined,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  Text(
                    "Kipos App",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.red[300],
            ),
          ),
          ListTile(
            title: Text('Anasayfa'),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homePage()),
              );
            },
          ),
          ListTile(
            title: Text('Kahve ve Ekipman'),
            trailing: Icon(Icons.local_cafe_sharp),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductCoffeeView()),
              );
            },
          ),
          ListTile(
            title: Text('Çay'),
            trailing: Icon(Icons.emoji_food_beverage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeaView()),
              );
            },
          ),
          ListTile(
            title: Text('Mocktail'),
            trailing: Icon(Icons.local_bar),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MocktailView()),
              );
            },
          ),
          ListTile(
            title: Text('Tatlılar'),
            trailing: Icon(Icons.cake),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DessertView()),
              );
            },
          ),
          ListTile(
            title: Text('Demleme Rehberi'),
            trailing: Icon(Icons.text_snippet_outlined),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GuideView()),
              );
            },
          ),
          ListTile(
            title: Text('Blog'),
            trailing: Icon(Icons.text_snippet),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostView()),
              );
            },
          ),
          ListTile(
            title: Text('Vlog'),
            trailing: Icon(Icons.video_collection),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VlogView()),
              );
            },
          ),
          ListTile(
            title: Text('Sizden Gelen Tarifler'),
            trailing: Icon(Icons.contact_support),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeView()),
              );
            },
          ),
          ListTile(
            title: Text('Sizden Gelen Sorular'),
            trailing: Icon(Icons.contact_support),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionsView()),
              );
            },
          ),
          ListTile(
            title: Text('Anlaşmalı Firmalar'),
            trailing: Icon(Icons.gps_not_fixed),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompaniesView()),
              );
            },
          ),
          ListTile(
            title: Text('Çıkış Yap'),
            trailing: Icon(Icons.logout),
            onTap: () {
              _authService.signOut();
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EnterPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
