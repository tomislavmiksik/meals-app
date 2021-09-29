import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currFilters;

  FiltersScreen(this.saveFilters, this.currFilters);

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
  initState() {
    isGlutenFree = widget.currFilters['gluten'] as bool;
    isLactoseFree = widget.currFilters['lactose'] as bool;
    isVegan = widget.currFilters['vegan'] as bool;
    isVegetarian = widget.currFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget filterCardBuilder(
      bool currValue, String title, String description, Function updateValue) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          SwitchListTile(
            activeColor: Colors.deepOrange,
            inactiveThumbColor: Colors.black38,
            inactiveTrackColor: Colors.black45,
            onChanged: (newValue) => updateValue(newValue),
            value: currValue,
            title: Text(title),
            subtitle: Text(
              description,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 2,
          ),
        ],
      ),
    );
  }

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
            height: 2,
          ),
          filterCardBuilder(
              isGlutenFree,
              'Gluten free',
              'Exclude all non gluten free items',
              (newValue) => setState(() {
                    isGlutenFree = newValue;
                  })),
          filterCardBuilder(
              isLactoseFree,
              'Lactose free',
              'Exclude all items containing lactose',
              (newValue) => setState(() {
                    isLactoseFree = newValue;
                  })),
          filterCardBuilder(
              isVegan,
              'Vegan',
              'Show only vegan items',
              (newValue) => setState(() {
                    isVegan = newValue;
                  })),
          filterCardBuilder(
            isVegetarian,
            'Vegetarian',
            'Show only vegetarian items',
            (newValue) => setState(
              () {
                isVegetarian = newValue;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final selectedFilters = {
            'gluten': isGlutenFree,
            'lactose': isLactoseFree,
            'vegan': isVegan,
            'vegetarian': isVegetarian,
          };
          widget.saveFilters(selectedFilters);
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
