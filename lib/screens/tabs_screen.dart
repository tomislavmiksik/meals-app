import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'categories_screen.dart';
import 'favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  @override
  _TabScreenState createState() => _TabScreenState();

  TabsScreen(this.favouriteMeals);
}

class _TabScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> pages;
  int _selectedPageIndex = 0;

  initState() {
    pages = [
      {'title': 'Categories', 'page': CategoriesScreen()},
      {'title': 'Favourites', 'page': FavouritesScreen(widget.favouriteMeals)},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //doesn't need stateful widget for top tab bar, usually used in Android apps, requires less work than the bottomNavBar
    //
    //

    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     drawer:Drawer(
    //       child: Text('text'),
    //     ),
    //     appBar: AppBar(
    //       title: Text('Mealz 4 Dayz'),
    //       bottom: TabBar(
    //         indicatorColor: Color(0xFFFF4C29),
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //           )
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: [
    //       CategoriesScreen(),
    //       FavouritesScreen(),
    //     ],),
    //   ),
    // );

    //second way of making a navbar using the bottomNavBar widget, requires stateful widget
    //
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]['title']),
      ),
      body: pages[_selectedPageIndex]['page'],
      drawer: Drawer(
        child: MainDrawer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        unselectedLabelStyle: TextStyle(color: Color(0xFFFF4C29)),
        selectedItemColor: Color(0xFFFF4C29),
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF082032),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
