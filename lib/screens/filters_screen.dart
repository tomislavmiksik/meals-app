import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Filter Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Select your preferences',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  onChanged: (bool value) {
                    setState((){
                      isGlutenFree = value;
                    });
                  },
                  value: isGlutenFree,
                  title: Text('Gluten Free'),
                  subtitle: const Text(
                    'Exclude non gluten free items',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
