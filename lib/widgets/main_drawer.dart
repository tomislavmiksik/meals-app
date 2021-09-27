import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  //build method for reusable tiles
  //
  //
  Widget buildListTile(String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //simple container with title of the app
          //
          //
          Container(
            height: 120,
            color: Color(0xFF2C394B),
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Mealz 4 Dayz',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
            height: 0,
          ),
          const SizedBox(
            height: 20,
          ),

          //list tiles containing screen info and redirects that replace the last page on the stack
          //
          //
          buildListTile(
            'Meals',
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () =>  Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
